using Newtonsoft.Json;

namespace PHbeatASP.Models.ControllerModels;

public class TokenResponse
{
    [JsonProperty("access_token")]
    public string AccessToken { get; set; } // 访问令牌

    [JsonProperty("expires_in")]
    public int ExpiresIn { get; set; } // 过期时间（秒）

    [JsonProperty("error")]
    public string Error { get; set; } // 错误信息

    [JsonProperty("error_description")]
    public string ErrorDescription { get; set; } // 错误描述
}
