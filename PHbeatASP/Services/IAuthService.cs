using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;

namespace PHbeatASP.Services;

public interface IAuthService
{
    Task<AuthResponse> RegisterAsync(ExtendedRegisterRequest request);
    Task<AuthResponse> LoginEmailAsync(ExtendedLoginRequest request);
    Task<AuthResponse> LoginPhoneAsync(ExtendedLoginRequest request);
}

public class AuthService : IAuthService
{
    private readonly ILogger<AuthService> _logger;
    private readonly UserManager<LoveUser> _userManager;
    private readonly SignInManager<LoveUser> _signInManager;
    private readonly IConfiguration _configuration;

    public AuthService(ILogger<AuthService> logger, UserManager<LoveUser> userManager,
        SignInManager<LoveUser> signInManager, IConfiguration configuration)
    {
        _logger = logger;
        _userManager = userManager;
        _signInManager = signInManager;
        _configuration = configuration;
    }

    private string GenerateToken(LoveUser user)
    {
        if (user == null)
            throw new ArgumentNullException(nameof(user));

        var keyString = _configuration["Jwt:Key"];
        if (string.IsNullOrEmpty(keyString))
        {
            _logger.LogError("JWT Key is missing in configuration.");
            throw new InvalidOperationException("JWT Key is not configured.");
        }

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(keyString));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _configuration["Jwt:Issuer"],
            audience: _configuration["Jwt:Audience"],
            claims: new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email)
            },
            expires: DateTime.UtcNow.AddHours(1),
            signingCredentials: credentials
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    private UserInfo CreateUserInfo(LoveUser user)
    {
        if (user == null)
            throw new ArgumentNullException(nameof(user));

        return new UserInfo
        {
            Username = user.UserName,
            Email = user.Email,
            Avatar = user.Avatar
        };
    }

    public async Task<AuthResponse> RegisterAsync(ExtendedRegisterRequest request)
    {
        try
        {
            if (await _userManager.FindByEmailAsync(request.Email) != null)
            {
                _logger.LogWarning("注册尝试使用已注册的邮箱: {Email}", request.Email);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "邮箱已被注册"
                };
            }

            var user = new LoveUser
            {
                Email = request.Email,
                UserName = request.Username,
                PhoneNumber = request.PhoneNumber,
                Gender = request.Gender,
                Avatar = "https://cdn.jsdelivr.net/gh/PHBeat/PHBeat-CDN@main/PHBeat/Avatar/default.jpg",
                UserType = "普通用户",
                RegisterTime = DateTime.UtcNow,
            };

            var result = await _userManager.CreateAsync(user, request.Password);
            if (!result.Succeeded)
            {
                _logger.LogError("用户创建失败，邮箱: {Email}, 错误: {Errors}",
                    request.Email, string.Join(", ", result.Errors.Select(e => e.Description)));

                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = string.Join(", ", result.Errors.Select(e => e.Description))
                };
            }

            var roleResult = await _userManager.AddToRoleAsync(user, user.UserType);
            if (!roleResult.Succeeded)
            {
                _logger.LogError("添加用户到角色失败: {UserId} ({Email}), 错误: {Errors}",
                    user.Id, user.Email, string.Join(", ", roleResult.Errors.Select(e => e.Description)));
            }

            var claimResult = await _userManager.AddClaimAsync(user, new Claim("UserType", user.UserType));
            if (!claimResult.Succeeded)
            {
                _logger.LogError("添加声明到用户失败: {UserId} ({Email}), 错误: {Errors}",
                    user.Id, user.Email, string.Join(", ", claimResult.Errors.Select(e => e.Description)));
            }

            _logger.LogInformation("用户注册成功: {UserId} ({Email})", user.Id, user.Email);

            return new AuthResponse
            {
                Token = GenerateToken(user),
                User = CreateUserInfo(user),
                Error = null
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "注册过程中发生错误，邮箱: {Email}", request.Email);
            return new AuthResponse
            {
                Token = null,
                User = null,
                Error = "发生内部服务器错误"
            };
        }
    }

    public async Task<AuthResponse> LoginEmailAsync(ExtendedLoginRequest request)
    {
        // 验证邮箱和密码是否匹配
        if (!string.IsNullOrEmpty(request.Email) && !string.IsNullOrEmpty(request.Password))
        {
            // 实现邮箱+密码的验证逻辑
            try
            {
                var user = await _userManager.FindByEmailAsync(request.Email);
                if (user == null)
                {
                    _logger.LogWarning("登录尝试使用不存在的邮箱: {Email}", request.Email);
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
                    _logger.LogInformation("用户登录成功: {UserId} ({Email})", user.Id, user.Email);

                    return new AuthResponse
                    {
                        Token = GenerateToken(user),
                        User = CreateUserInfo(user),
                        Error = null
                    };
                }

                _logger.LogWarning("登录失败，邮箱: {Email}", request.Email);

                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "密码错误"
                };
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "登录过程中发生错误，邮箱: {Email}", request.Email);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "发生内部服务器错误"
                };
            }
        }
        else
        {
            _logger.LogWarning("登录尝试使用无效的邮箱或密码");
            return new AuthResponse
            {
                Token = null,
                User = null,
                Error = "邮箱或密码无效"
            };
        }
    }

    public async Task<AuthResponse> LoginPhoneAsync(ExtendedLoginRequest request)
    {
        try
        {
            var user = await _userManager.Users.FirstOrDefaultAsync(u => u.PhoneNumber == request.PhoneNumber);
            if (user == null)
            {
                _logger.LogWarning("登录尝试使用不存在的手机号: {PhoneNumber}", request.PhoneNumber);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "用户不存在"
                };
            }

            // 检查用户的手机号是否匹配（冗余判断可选）
            if (user.PhoneNumber != request.PhoneNumber)
            {
                _logger.LogWarning("手机号不匹配，手机号: {PhoneNumber}", request.PhoneNumber);
                return new AuthResponse
                {
                    Token = null,
                    User = null,
                    Error = "手机号不匹配"
                };
            }

            // 登录成功返回Token和用户信息
            _logger.LogInformation("用户通过手机号登录成功: {UserId} ({Email})", user.Id, user.Email);

            return new AuthResponse
            {
                Token = GenerateToken(user),
                User = CreateUserInfo(user),
                Error = null
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "通过手机号登录过程中发生错误，手机号: {PhoneNumber}", request.PhoneNumber);
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
        while (await _userManager.FindByNameAsync(username) != null)
        {
            username = $"{originalUsername}{counter++}";
        }

        return username;
    }
}