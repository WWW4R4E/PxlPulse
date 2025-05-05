namespace PHbeatASP.Models.DbModels;

public class Notification
{
    public int NotificationId { get; set; }
    public int UserId { get; set; }
    public string Content { get; set; }
    public string Type { get; set; } // system, message, like, etc.
    public bool IsRead { get; set; }
    public DateTime CreateTime { get; set; } = DateTime.UtcNow;

    public LoveUser User { get; set; }
}