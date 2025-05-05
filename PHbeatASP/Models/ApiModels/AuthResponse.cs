namespace PHbeatASP.Models.ApiModels;

public class AuthResponse
{
    public string? Token { get; set; }
    public UserInfo? User { get; set; }
    public string? Error { get; set; }
}

