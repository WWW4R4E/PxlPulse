using Newtonsoft.Json;
using PHbeatASP.Models.ControllerModels;

namespace PHbeatASP.Services;

public interface IAsrService
{
    Task<string> RecognizeAsync(IFormFile audioFile);
}

public class AsrService : IAsrService
{
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;
    private readonly string _secretKey;

    public AsrService(HttpClient httpClient, IConfiguration configuration)
    {
        _httpClient = httpClient;
        _apiKey = configuration["Asr:ApiKey"];
        _secretKey = configuration["Asr:SecretKey"];
    }

    public async Task<string> RecognizeAsync(IFormFile audioFile)
    {
        var token = await GetAccessTokenAsync();
        var content = new MultipartFormDataContent
        {
            { new StreamContent(audioFile.OpenReadStream()), "file", audioFile.FileName }
        };
       // 
        var response = await _httpClient.PostAsync(
            
            $"https://vop.baidu.com/server_api?cuid=123&token={token}", 
            content);

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<AsrResponse>(result).Result[0];
    }

    private async Task<string> GetAccessTokenAsync()
    {
        var response = await _httpClient.GetAsync(
            $"https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id={_apiKey}&client_secret={_secretKey}");

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<TokenResponse>(result).AccessToken;
    }
}
