using System.ComponentModel.DataAnnotations;

namespace PHbeatASP.Models.ApiModels;

public class ExtendedLoginRequest
{
    public string? Email { get; set; }
    public string? PhoneNumber { get; set; }
    [Required]public string Password { get; set; }
}