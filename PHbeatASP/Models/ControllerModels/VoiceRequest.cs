namespace PHbeatASP.Models.ControllerModels;

public class VoiceRequest
{
    public IFormFile AudioFile { get; set; } // 语音文件
    public string UserId { get; set; } // 用户ID
    public string SessionId { get; set; } // 会话ID
}