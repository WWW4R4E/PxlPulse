using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly ILogger<AuthController> _logger;
    private readonly IAuthService _authService;

    public AuthController(ILogger<AuthController> logger, IAuthService authService)
    {
        _logger = logger;
        _authService = authService;
    }

    [HttpPost("register")]
    public async Task<IActionResult> Register([FromBody] ExtendedRegisterRequest request)
    {
        _logger.LogInformation("用户注册: {Email}", request.Email);
        var result = await _authService.RegisterAsync(request);
        return Ok(result);
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] ExtendedLoginRequest request)
    {
        AuthResponse result;
        _logger.LogInformation("用户登录: {auth}", request.Email ?? request.PhoneNumber);
        if  (request.Email == null)
        { 
            result = await _authService.LoginEmailAsync(request);
        }
        else
        {
            result = await _authService.LoginPhoneAsync(request);
        }
       
        
        return Ok(result);
    }
}