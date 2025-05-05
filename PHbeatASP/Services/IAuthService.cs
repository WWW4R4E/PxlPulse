using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.IdentityModel.Tokens;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;

namespace PHbeatASP.Services;

public interface IAuthService
{
    Task<AuthResponse> RegisterAsync(ExtendedRegisterRequest request);
    Task<AuthResponse> LoginAsync(LoginRequest request);
}

public class AuthService : IAuthService
{
    private readonly ILogger<AuthService> _logger;
    private readonly UserManager<LoveUser> _userManager;
    private readonly SignInManager<LoveUser> _signInManager;
    private readonly IConfiguration _configuration;
    
    public AuthService(ILogger<AuthService> logger, UserManager<LoveUser> userManager, SignInManager<LoveUser> signInManager, IConfiguration configuration)
    {
        _logger = logger;
        _userManager = userManager;
        _signInManager = signInManager;
        _configuration = configuration;
    }

    private string GenerateToken(LoveUser user)
    {
        var key = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]!));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _configuration["Jwt:Issuer"],
            audience: _configuration["Jwt:Audience"],
            claims: new[] 
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.UserId.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email)
            },
            expires: DateTime.Now.AddHours(1),
            signingCredentials: credentials
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public async Task<AuthResponse> RegisterAsync(ExtendedRegisterRequest request)
    {
        try
        {
            if (await _userManager.FindByEmailAsync(request.BaseRequest.Email) != null)
            {
                _logger.LogWarning("Registration attempt with already registered email: {Email}", request.BaseRequest.Email);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "邮箱已被注册"
                };
            }

            var user = new LoveUser
            {
                Email = request.BaseRequest.Email,
                Username = request.Username,
                PhoneNumber = request.PhoneNumber,
                Avatar = "https://cdn.jsdelivr.net/gh/PHBeat/PHBeat-CDN@main/PHBeat/Avatar/default.jpg",
                UserType = "普通用户",
                RegisterTime = DateTime.UtcNow,
            };

            var result = await _userManager.CreateAsync(user, request.BaseRequest.Password);
            if (!result.Succeeded)
            {
                _logger.LogError("User creation failed for email: {Email}, Errors: {Errors}", 
                    request.BaseRequest.Email, string.Join(", ", result.Errors.Select(e => e.Description)));
                
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = string.Join(", ", result.Errors.Select(e => e.Description))
                };
            }

            await _userManager.AddToRoleAsync(user, user.UserType);
            await _userManager.AddClaimAsync(user, new Claim("UserType", user.UserType));
            
            _logger.LogInformation("User registered successfully: {UserId} ({Email})", user.UserId, user.Email);
            
            return new AuthResponse
            {
                Token = GenerateToken(user),
                User = new UserInfo
                {
                    UserId = user.UserId,
                    Username = user.Username,
                    Email = user.Email,
                    Avatar = user.Avatar
                },
                Error = null
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "An error occurred during registration for email: {Email}", request.BaseRequest.Email);
            return new AuthResponse
            {
                Token = null,
                User = null,
                Error = "发生内部服务器错误"
            };
        }
    }

    public async Task<AuthResponse> LoginAsync(LoginRequest request)
    {
        try
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                _logger.LogWarning("Login attempt with non-existent email: {Email}", request.Email);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "用户不存在"
                };
            }

            var result = await _signInManager.PasswordSignInAsync(user, request.Password, false, false);
            if (result.Succeeded)
            {
                _logger.LogInformation("User logged in successfully: {UserId} ({Email})", user.UserId, user.Email);
                
                return new AuthResponse
                {
                    Token = GenerateToken(user),
                    User = new UserInfo
                    {
                        UserId = user.UserId,
                        Username = user.Username,
                        Email = user.Email,
                        Avatar = user.Avatar
                    },
                    Error = null
                };
            }
            
            _logger.LogWarning("Failed login attempt for email: {Email}", request.Email);
            
            return new AuthResponse
            {
                Token = null,
                User = null,
                Error = "密码错误"
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "An error occurred during login for email: {Email}", request.Email);
            return new AuthResponse
            {
                Token = null,
                User = null,
                Error = "发生内部服务器错误"
            };
        }
    }

    private async Task<string> GenerateUsername(string email)
    {
        // 从邮箱生成用户名的基本逻辑
        var username = email.Split('@')[0];
        
        // 如果用户名已存在，添加随机后缀
        var originalUsername = username;
        var counter = 1;
        while (await _userManager.FindByNameAsync(username) == null)
        {
            username = $"{originalUsername}{counter++}";
        }
        
        return username;
    }
}
