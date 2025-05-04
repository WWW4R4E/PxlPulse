using Newtonsoft.Json;

namespace PHbeatASP.Models._ApiModels;

public class NlpRequest
{
    [JsonProperty("text")]
    public string Text { get; set; }

    [JsonProperty("user_id")]
    public string UserId { get; set; }
}