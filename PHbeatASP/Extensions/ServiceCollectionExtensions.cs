using PHbeatASP.Services;

namespace PHbeatASP.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddVoiceServices(this IServiceCollection services)
    {
        services.AddHttpClient<AsrService>();
        services.AddScoped<IAsrService, AsrService>();
        services.AddScoped<INlpService, NlpService>();
        services.AddScoped<ITtsService, TtsService>();
        services.AddScoped<IVoiceService, VoiceService>();
        return services;
    }
}
