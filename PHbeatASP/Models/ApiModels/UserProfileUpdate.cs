namespace PHbeatASP.Models.ApiModels;

public class UserProfileUpdate
{
    public int UserId { get; set; }
    public string? Username { get; set; }
    public string? Email { get; set; }
    public string? PhoneNumber { get; set; }
    public string? Avatar { get; set; }
    public Enums.GenderType? Gender { get; set; }
    public string? UserType { get; set; }
    public DateTime? Birthday { get; set; }
}