using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers;

[Authorize]
[ApiController]
[Route("api/[controller]")]
public class UserController : ControllerBase
{
    private readonly ILogger<UserController> _logger;
    private readonly IUserService _userService;

    public UserController(ILogger<UserController> logger, IUserService userService)
    {
        _logger  = logger;
        _userService = userService;
    }

    [HttpGet("profile")]
    public async Task<IActionResult> GetProfile()
    {
        var userId = int.Parse(User.FindFirst("sub")?.Value).ToString();
        var profile = await _userService.GetUserProfileAsync(userId);
        _logger.LogInformation($"用户 {userId} 获取了他们的个人资料。");
        return Ok(profile);
    }

    [HttpPatch("profile")]
    public async Task<IActionResult> UpdateProfile([FromBody] UserProfileUpdate update)
    {
        var userId = int.Parse(User.FindFirst("sub")?.Value).ToString();
        await _userService.UpdateUserProfileAsync(userId, update);
        _logger.LogInformation($"用户 {userId} 更新了他们的个人资料。");
        return NoContent();
    }

    [HttpPost("notifications/{notificationId}/read")]
    public async Task<IActionResult> MarkAsRead(string notificationId)
    {
        await _userService.MarkNotificationAsReadAsync(notificationId);
        _logger.LogInformation($"用户 {User.FindFirst("sub")?.Value} 将通知 {notificationId} 标记为已读。");
        return NoContent();
    }
}