using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
using PHbeatASP.Models._ApiModels;

namespace PHbeatASP.Services;

public class CachedVoiceService : IVoiceService
{
    private readonly IVoiceService _voiceService;
    private readonly IDistributedCache _cache;

    public CachedVoiceService(IVoiceService voiceService, IDistributedCache cache)
    {
        _voiceService = voiceService;
        _cache = cache;
    }

    public async Task<VoiceResponse> ProcessVoiceAsync(VoiceRequest request)
    {
        var cacheKey = $"voice_{request.UserId}_{request.SessionId}";
        var cachedResponse = await _cache.GetStringAsync(cacheKey);

        if (!string.IsNullOrEmpty(cachedResponse))
        {
            return JsonConvert.DeserializeObject<VoiceResponse>(cachedResponse);
        }

        var response = await _voiceService.ProcessVoiceAsync(request);
        await _cache.SetStringAsync(cacheKey, JsonConvert.SerializeObject(response), new DistributedCacheEntryOptions
        {
            AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(5)
        });

        return response;
    }
}
