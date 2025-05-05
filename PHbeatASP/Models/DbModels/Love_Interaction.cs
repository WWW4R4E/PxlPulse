namespace PHbeatASP.Models.DbModels;

public class LoveInteraction
{
    public string InteractionId { get; set; }
    public string UserId { get; set; }
    public string CharacterId { get; set; }
    public string InteractionContent { get; set; }
    public DateTime InteractionTime { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; }
    public AiCharacter Character { get; set; }
}