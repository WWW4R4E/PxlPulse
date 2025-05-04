using Newtonsoft.Json;

namespace PHbeatASP.Models.ControllerModels;

public class AsrResponse
{
    [JsonProperty("result")]
    public List<string> Result { get; set; } // 识别结果列表

    [JsonProperty("error_code")]
    public string ErrorCode { get; set; } // 错误码

    [JsonProperty("error_msg")]
    public string ErrorMsg { get; set; } // 错误信息
}
