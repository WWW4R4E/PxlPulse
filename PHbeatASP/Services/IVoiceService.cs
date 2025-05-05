using PHbeatASP.Models.ApiModels;

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
        var text = await _asrService.RecognizeAsync(request.AudioFile);

        var responseText = await _nlpService.ProcessAsync(text, request.UserId);

        var audioBytes = await _ttsService.SynthesizeAsync(responseText);

        return new VoiceResponse
        {
            Text = responseText,
            Audio = audioBytes
        };
    }
}
