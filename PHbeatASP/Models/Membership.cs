using System.ComponentModel.DataAnnotations;

namespace DefaultNamespace;

public class Membership
{
    [Key]
    public int MembershipId { get; set; }
    public int UserId { get; set; }
    public int MembershipLevel { get; set; }
    public DateTime StartTime { get; set; }
    public DateTime EndTime { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; }
}