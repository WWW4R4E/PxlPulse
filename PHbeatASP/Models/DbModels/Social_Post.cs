namespace PHbeatASP.Models.DbModels;

public class SocialPost
{
    public string PostId { get; set; }
    public string UserId { get; set; }
    public string PostContent { get; set; }
    public DateTime PostTime { get; set; }
    public int LikesCount { get; set; }
    public int CommentsCount { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; }
}