using PHbeatASP.Models.ControllerModels;

namespace PHbeatASP.Services;

public class ConcurrentVoiceService : IVoiceService
{
    private readonly IVoiceService _voiceService;
    private readonly SemaphoreSlim _semaphore;

    public ConcurrentVoiceService(IVoiceService voiceService)
    {
        _voiceService = voiceService;
        _semaphore = new SemaphoreSlim(10); // 限制并发数为10
    }

    public async Task<VoiceResponse> ProcessVoiceAsync(VoiceRequest request)
    {
        await _semaphore.WaitAsync();
        try
        {
            return await _voiceService.ProcessVoiceAsync(request);
        }
        finally
        {
            _semaphore.Release();
        }
    }
}
