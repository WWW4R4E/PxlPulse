using Microsoft.AspNetCore.Mvc;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Services;

namespace PHbeatASP.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MessageController : ControllerBase
    {
        private ILogger<MessageController> _logger;
        private readonly IMessageService _messageService;

        public MessageController(ILogger<MessageController> logger,IMessageService messageService)
        {
            _logger = logger;
            _messageService = messageService;
        }

        [HttpGet("send")]
        public async Task<IActionResult> SendMessage([FromQuery] MessageRequest request)
        {
            var result = await _messageService.SendMessageAsync(request);
            _logger.LogInformation("消息发送: {0}", result);
            return Ok(result);
        }

        [HttpGet("session/{sessionId}")]
        public async Task<IActionResult> GetMessages(string sessionId)
        {
            var result = await _messageService.GetMessagesBySessionIdAsync(sessionId);
            _logger.LogInformation("消息查询: {0}", result);
            return Ok(result);
        }
        
        
    }
}
