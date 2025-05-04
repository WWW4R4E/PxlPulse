namespace PHbeatASP.Services;

public interface ITtsService
{
    Task<byte[]> SynthesizeAsync(string text);
}
