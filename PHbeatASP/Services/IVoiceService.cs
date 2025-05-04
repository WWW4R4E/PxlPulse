using PHbeatASP.Models._ApiModels;

namespace PHbeatASP.Services;

public interface IVoiceService
{
    Task<VoiceResponse> ProcessVoiceAsync(VoiceRequest request);
}

public class VoiceService : IVoiceService
{
    private readonly IAsrService _asrService;
    private readonly INlpService _nlpService;
    private readonly ITtsService _ttsService;

    public VoiceService(IAsrService asrService, INlpService nlpService, ITtsService ttsService)
    {
        _asrService = asrService;
        _nlpService = nlpService;
        _ttsService = ttsService;
    }

    public async Task<VoiceResponse> ProcessVoiceAsync(VoiceRequest request)
    {
        // 1. 语音转文字
        var text = await _asrService.RecognizeAsync(request.AudioFile);

        // 2. 自然语言处理
        var responseText = await _nlpService.ProcessAsync(text, request.UserId);

        // 3. 文字转语音
        var audioBytes = await _ttsService.SynthesizeAsync(responseText);

        return new VoiceResponse
        {
            Text = responseText,
            Audio = audioBytes
        };
    }
}
