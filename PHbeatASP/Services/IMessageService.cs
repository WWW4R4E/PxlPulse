using System.Collections.Concurrent;
using Microsoft.AspNetCore.SignalR;
using PHbeatASP.Hub;
using PHbeatASP.Models;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;

namespace PHbeatASP.Services;

public interface IMessageService
{
    Task<MessageResponse> SendMessageAsync(MessageRequest request);
    Task<IEnumerable<MessageResponse>> GetMessagesBySessionIdAsync(string sessionId);
}

public class MessageService : IMessageService
{
    private readonly ConcurrentDictionary<string, List<MessageResponse>> _messages = new();
    private readonly IHubContext<MessageHub> _hubContext;
    private readonly LoveDbContext _dbContext;
    private readonly INlpService _nlpService;

    public MessageService(IHubContext<MessageHub> hubContext, LoveDbContext dbContext, INlpService nlpService)
    {
        _hubContext = hubContext;
        _dbContext = dbContext;
        _nlpService = nlpService;
    }

    public async Task<MessageResponse> SendMessageAsync(MessageRequest request)
    {
        var response = new MessageResponse
        {
            SessionId = request.SessionId,
            Text = request.Text,
            Role = Enums.RoleType.User,
            Timestamp = DateTime.UtcNow
        };
        _messages[request.SessionId].Add(response);
        var nplResult = await _nlpService.ProcessAsync(request.Text, request.SessionId);
        var aiResponse = new MessageResponse
        {
            SessionId = request.SessionId,
            Text = nplResult,
            Role = Enums.RoleType.Assistant,
            Timestamp = DateTime.UtcNow
        };
        return await Task.FromResult(aiResponse);
    }

    public async Task<IEnumerable<MessageResponse>> GetMessagesBySessionIdAsync(string sessionId)
    {
        if (_messages.TryGetValue(sessionId, out var messageList))
        {
            return await Task.FromResult(messageList.AsEnumerable());
        }

        return await Task.FromResult(Enumerable.Empty<MessageResponse>());
    }
}