namespace PHbeatASP.Models.DbModels;

public class AiCharacter
{
    public int CharacterId { get; set; }
    public string CharacterName { get; set; }
    public string CharacterImage { get; set; }
    public string Personality { get; set; }
    public int CreatorId { get; set; }

    // 外键导航属性
    public LoveUser Creator { get; set; }
}