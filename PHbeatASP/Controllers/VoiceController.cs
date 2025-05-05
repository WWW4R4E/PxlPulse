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
            _logger.LogInformation("正在处理语音请求: {RequestId}", request.SessionId);
            var result = await _voiceService.ProcessVoiceAsync(request);
            _logger.LogInformation("语音请求处理成功: {ResultId}", result?.Text);
            return Ok(result);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "处理语音请求时发生错误");
            return StatusCode(500, "服务器内部错误");
        }
    }
}