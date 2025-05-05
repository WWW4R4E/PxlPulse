namespace PHbeatASP.Models.DbModels;

public class AiCharacter
{
    public string CharacterId { get; set; }
    public string CharacterName { get; set; }
    public string CharacterImage { get; set; }
    public string Personality { get; set; }
    public string CreatorId { get; set; }

    // 外键导航属性
    public LoveUser Creator { get; set; }
}