using Newtonsoft.Json;
using PHbeatASP.Models.ApiModels;

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
    private readonly string _tokenUrl;  // 新增配置字段
    private readonly string _apiUrl;    // 新增配置字段

    public AsrService(HttpClient httpClient, IConfiguration configuration)
    {
        _httpClient = httpClient;
        _apiKey = configuration["Asr:ApiKey"];
        _secretKey = configuration["Asr:SecretKey"];
        _tokenUrl = configuration["Asr:TokenUrl"];  // 从配置读取
        _apiUrl = configuration["Asr:ApiUrl"];      // 从配置读取
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
            $"{_apiUrl}?cuid=123&token={token}",  // 使用配置的API地址
            content);

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<AsrResponse>(result).Result[0];
    }

    private async Task<string> GetAccessTokenAsync()
    {
        var response = await _httpClient.GetAsync(
            $"{_tokenUrl}?grant_type=client_credentials&client_id={_apiKey}&client_secret={_secretKey}");

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<TokenResponse>(result).AccessToken;
    }
}
