using System.ComponentModel.DataAnnotations;

namespace PHbeatASP.Models.ApiModels;

public class ExtendedRegisterRequest
{
    public string Email { get; init; }
    [Required] public string Username { get; set; }
    [Required] public string PhoneNumber { get; set; }
    [Required] public required string Password { get; set; }
    [Required] public Enums.GenderType Gender { get; set; }
}