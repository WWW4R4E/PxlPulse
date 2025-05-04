using System.Text;
using Newtonsoft.Json;
using PHbeatASP.Models.ControllerModels;

namespace PHbeatASP.Services;

public class TtsService : ITtsService
{
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;
    private readonly string _secretKey;

    public TtsService(HttpClient httpClient, IConfiguration configuration)
    {
        _httpClient = httpClient;
        _apiKey = configuration["Tts:ApiKey"];
        _secretKey = configuration["Tts:SecretKey"];
    }

    public async Task<byte[]> SynthesizeAsync(string text)
    {
        var token = await GetAccessTokenAsync();
        var request = new TtsRequest
        {
            Text = text,
            Lan = "zh",
            Ctp = 1,
            Spd = 5,
            Pit = 5,
            Vol = 5,
            Per = 0
        };

        var content = new StringContent(JsonConvert.SerializeObject(request), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync(
            $"https://aip.bce.com/rpc/2.0/tts/v1/create?access_token={token}", 
            content);

        response.EnsureSuccessStatusCode();

        return await response.Content.ReadAsByteArrayAsync();
    }

    private async Task<string> GetAccessTokenAsync()
    {
        var response = await _httpClient.GetAsync(
            $"https://aip.bce.com/oauth/2.0/token?grant_type=client_credentials&client_id={_apiKey}&client_secret={_secretKey}");

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<TokenResponse>(result).AccessToken;
    }
}

public class TtsRequest
{
    [JsonProperty("tex")]
    public string Text { get; set; }

    [JsonProperty("lan")]
    public string Lan { get; set; } = "zh";

    [JsonProperty("ctp")]
    public int Ctp { get; set; } = 1;

    [JsonProperty("spd")]
    public int Spd { get; set; } = 5;

    [JsonProperty("pit")]
    public int Pit { get; set; } = 5;

    [JsonProperty("vol")]
    public int Vol { get; set; } = 5;

    [JsonProperty("per")]
    public int Per { get; set; } = 0;
}
