using System.Text;
using Newtonsoft.Json;
using PHbeatASP.Models.ControllerModels;

namespace PHbeatASP.Services;

public class NlpService : INlpService
{
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;
    private readonly string _secretKey;

    public NlpService(HttpClient httpClient, IConfiguration configuration)
    {
        _httpClient = httpClient;
        _apiKey = configuration["Nlp:ApiKey"];
        _secretKey = configuration["Nlp:SecretKey"];
    }

    public override async Task<string> ProcessAsync(string inputText, string userId)
    {
        var token = await GetAccessTokenAsync();
        var request = new NlpRequest
        {
            Text = inputText,
            UserId = userId
        };

        var content = new StringContent(JsonConvert.SerializeObject(request), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync(
            $"https://aip.bce.com/rpc/2.0/nlp/v1/simnet?access_token={token}", 
            content);

        response.EnsureSuccessStatusCode();

        var result = await response.Content.ReadAsStringAsync();
        return JsonConvert.DeserializeObject<NlpResponse>(result).Result;
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

public class NlpRequest
{
    [JsonProperty("text")]
    public string Text { get; set; }

    [JsonProperty("user_id")]
    public string UserId { get; set; }
}

public class NlpResponse
{
    [JsonProperty("result")]
    public string Result { get; set; }
}
