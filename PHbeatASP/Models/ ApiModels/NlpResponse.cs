using Newtonsoft.Json;

namespace PHbeatASP.Models._ApiModels;

public class NlpResponse
{
    [JsonProperty("result")]
    public string Result { get; set; }
}
