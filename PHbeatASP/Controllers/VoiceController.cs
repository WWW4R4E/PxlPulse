using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models._ApiModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers;

[ApiController]
[Route("api/[controller]")]
public class VoiceController : ControllerBase
{
    private readonly IVoiceService _voiceService;

    public VoiceController(IVoiceService voiceService)
    {
        _voiceService = voiceService;
    }

    [HttpPost("process")]
    public async Task<IActionResult> ProcessVoice([FromForm] VoiceRequest request)
    {
        var result = await _voiceService.ProcessVoiceAsync(request);
        return Ok(result);
    }
}


