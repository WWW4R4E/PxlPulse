using Newtonsoft.Json;

namespace PHbeatASP.Models.ApiModels;

public class NlpResponse
{
    [JsonProperty("result")]
    public string Result { get; set; }
}
