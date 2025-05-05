using Microsoft.AspNetCore.SignalR;

namespace PHbeatASP.Hub
{
    public class MessageHub : Microsoft.AspNetCore.SignalR.Hub
    {
        public async Task SendNewMessage(string sessionId, string message)
        {
            await Clients.Group(sessionId).SendAsync("ReceiveMessage", message);
        }

        public async Task JoinSession(string sessionId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, sessionId);
        }

        public async Task LeaveSession(string sessionId)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, sessionId);
        }
    }
}
