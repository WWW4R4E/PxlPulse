using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private readonly IMessageService _messageService;

        public MessageController(IMessageService messageService)
        {
            _messageService = messageService;
        }

        [HttpPost("send")]
        public async Task<IActionResult> SendMessage([FromBody] MessageRequest request)
        {
            var result = await _messageService.SendMessageAsync(request);
            return Ok(result);
        }

        [HttpGet("session/{sessionId}")]
        public async Task<IActionResult> GetMessages(string sessionId)
        {
            var result = await _messageService.GetMessagesBySessionIdAsync(sessionId);
            return Ok(result);
        }
        
        
    }
}
