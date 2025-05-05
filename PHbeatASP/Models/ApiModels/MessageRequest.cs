using System.ComponentModel.DataAnnotations;

namespace PHbeatASP.Models.ApiModels
{
    public class MessageRequest
    {
        public string SessionId { get; set; }
        [Required] public string Text { get; set; }
    }
}
