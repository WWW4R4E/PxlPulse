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
    private readonly IUserService _userService;

    public UserController(IUserService userService)
    {
        _userService = userService;
    }

    [HttpGet("profile")]
    public async Task<IActionResult> GetProfile()
    {
        var userId = int.Parse(User.FindFirst("sub")?.Value);
        var profile = await _userService.GetUserProfileAsync(userId);
        return Ok(profile);
    }

    [HttpPatch("profile")]
    public async Task<IActionResult> UpdateProfile([FromBody] UserProfileUpdate update)
    {
        var userId = int.Parse(User.FindFirst("sub")?.Value);
        await _userService.UpdateUserProfileAsync(userId, update);
        return NoContent();
    }

    [HttpPost("notifications/{notificationId}/read")]
    public async Task<IActionResult> MarkAsRead(int notificationId)
    {
        await _userService.MarkNotificationAsReadAsync(notificationId);
        return NoContent();
    }
}