using System.Text.Json.Serialization;

namespace PHbeatASP.Models.DbModels;

public class LoveUser
{
    public int UserId { get; set; }
    public string Username { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }
    public DateTime RegisterTime { get; set; }
    public string Avatar { get; set; }
    public string Gender { get; set; }
    public DateTime Birthday { get; set; }
    public string UserType { get; set; } = "普通用户";

    [JsonIgnore]  // 新增密码哈希字段
    public string PasswordHash { get; set; }

    // 导航属性
    public ICollection<AiCharacter> AICharacters { get; set; }
    public ICollection<LoveInteraction> LoveInteractions { get; set; }
    public ICollection<LoveDiary> LoveDiaries { get; set; }
    public ICollection<SocialPost> SocialPosts { get; set; }
    public ICollection<Membership> Memberships { get; set; }
    public ICollection<Notification>? Notifications { get; set; }
}