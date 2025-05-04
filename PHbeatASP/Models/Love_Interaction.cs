namespace DefaultNamespace;

public class LoveInteraction
{
    public int InteractionId { get; set; }
    public int UserId { get; set; }
    public int CharacterId { get; set; }
    public string InteractionContent { get; set; }
    public DateTime InteractionTime { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; }
    public AiCharacter Character { get; set; }
}