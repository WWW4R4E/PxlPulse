using Newtonsoft.Json;

namespace PHbeatASP.Models.ApiModels;

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
