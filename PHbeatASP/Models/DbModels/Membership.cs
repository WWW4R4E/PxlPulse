using System.ComponentModel.DataAnnotations;

namespace PHbeatASP.Models.DbModels;

public class Membership
{
    [Key]
    public string MembershipId { get; set; }
    public string UserId { get; set; }
    public string MembershipLevel { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; }
}