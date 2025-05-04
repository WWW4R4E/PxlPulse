namespace PHbeatASP.Services;

public abstract class INlpService
{
    public abstract Task<string> ProcessAsync(string text, string requestUserId);
}