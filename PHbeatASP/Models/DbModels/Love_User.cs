using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Identity;

namespace PHbeatASP.Models.DbModels;

public class LoveUser:IdentityUser
{
    public DateTime RegisterTime { get; set; }
    public string Avatar { get; set; }
    public Enums.GenderType Gender { get; set; }
    public DateTime? Birthday { get; set; }
    public string UserType { get; set; } = "普通用户";

    // 导航属性
    public ICollection<AiCharacter> AICharacters { get; set; }
    public ICollection<LoveInteraction> LoveInteractions { get; set; }
    public ICollection<LoveDiary> LoveDiaries { get; set; }
    public ICollection<SocialPost> SocialPosts { get; set; }
    public ICollection<Membership> Memberships { get; set; }
    public ICollection<Notification>? Notifications { get; set; }
}