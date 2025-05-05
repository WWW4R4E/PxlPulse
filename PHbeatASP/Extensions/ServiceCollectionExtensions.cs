using Microsoft.AspNetCore.SignalR;
using PHbeatASP.Hub;
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
    
    public static IServiceCollection AddMessageServices(this IServiceCollection services)
    {
        services.AddScoped<IMessageService, MessageService>();
        // services.AddScoped<IHubContext<MessageHub>, HubContext<MessageHub>>();
        return services;
    }
    
    public static IServiceCollection AddAuthServices(this IServiceCollection services)
    {
        services.AddScoped<IAuthService, AuthService>();
        
        return services;
    }
    
    public static IServiceCollection AddUserServices(this IServiceCollection services)
    {
        services.AddScoped<IUserService, UserService>();
        return services;
    }
    
}
