using Newtonsoft.Json;

namespace PHbeatASP.Models.ApiModels;

// 文本生成请求
public class NlpResponse
{
    [JsonProperty("result")]
    public string Result { get; set; }
}
