namespace PHbeatASP.Models._ApiModels;

public class VoiceResponse
{
    public string Text { get; set; } // 语音转文字结果
    public byte[] Audio { get; set; } // 语音音频文件
}