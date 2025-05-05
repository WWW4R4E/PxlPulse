using Microsoft.AspNetCore.Identity.Data;

namespace PHbeatASP.Models.ApiModels;

public class ExtendedRegisterRequest
{
    public RegisterRequest BaseRequest { get; set; }
    
    public string Username { get; set; }
    public string PhoneNumber { get; set; }
}
