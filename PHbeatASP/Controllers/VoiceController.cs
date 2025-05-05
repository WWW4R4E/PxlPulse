using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers;

[ApiController]
[Route("api/[controller]")]
public class VoiceController : ControllerBase
{
    private readonly ILogger<VoiceController> _logger;
    private readonly IVoiceService _voiceService;

    public VoiceController(ILogger<VoiceController> logger, IVoiceService voiceService)
    {
        _logger = logger;
        _voiceService = voiceService;
    }

[HttpPost("process")]
public async Task<IActionResult> ProcessVoice([FromForm] VoiceRequest request)
{
    try
    {
        _logger.LogInformation("Processing voice request: {RequestId}", request.SessionId);
        var result = await _voiceService.ProcessVoiceAsync(request);
        _logger.LogInformation("Voice request processed successfully: {ResultId}", result?.Text);
        return Ok(result);
    }
    catch (Exception ex)
    {
        _logger.LogError(ex, "Error processing voice request");
        return StatusCode(500, "Internal server error");
    }
}

}


