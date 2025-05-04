namespace PHbeatASP.Models.DbModels;

public class LoveDiary
{
    public int DiaryId { get; set; }
    public int UserId { get; set; }
    public int CharacterId { get; set; }

    public required string DiaryTitle { get; set; }

    public string DiaryContent { get; set; } = string.Empty; 

    public DateTime DiaryDate { get; set; }

    // 外键导航属性
    public LoveUser User { get; set; } = default!;
    public AiCharacter Character { get; set; } = default!;
}
