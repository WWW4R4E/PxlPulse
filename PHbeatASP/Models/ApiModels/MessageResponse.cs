namespace PHbeatASP.Models.ApiModels
{
    public class MessageResponse
    {
        public string SessionId { get; set; }
        public string Text { get; set; }
        public DateTime Timestamp { get; set; }
        public Enums.RoleType Role { get; set; } 
    }

 
}
