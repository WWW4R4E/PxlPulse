using Microsoft.EntityFrameworkCore;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;

namespace PHbeatASP.Services;

public interface IUserService
{
    Task<LoveUser> GetUserProfileAsync(int userId);
    Task UpdateUserProfileAsync(int userId, UserProfileUpdate update);
    Task MarkNotificationAsReadAsync(int notificationId);
}

public class UserService : IUserService
{
    private readonly LoveDbContext _dbContext;

    public UserService(LoveDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<LoveUser> GetUserProfileAsync(int userId)
    {
        return (await _dbContext.Users
            .Include(u => u.Notifications)
            .FirstOrDefaultAsync(u => u.UserId == userId))!;
    }

    public async Task UpdateUserProfileAsync(int userId, UserProfileUpdate update)
    {
        var user = await _dbContext.Users.FindAsync(userId);
        if (user == null) throw new ArgumentException("User not found");
        if (!string.IsNullOrEmpty(update.Username)) user.Username = update.Username;
        if (!string.IsNullOrEmpty(update.Email)) user.Email = update.Email;
        if (!string.IsNullOrEmpty(update.PhoneNumber)) user.PhoneNumber = update.PhoneNumber;
        if (update.Birthday.HasValue) user.Birthday = update.Birthday.Value;
        if (!string.IsNullOrEmpty(update.Avatar)) user.Avatar = update.Avatar;
        if (!string.IsNullOrEmpty(update.Gender)) user.Gender = update.Gender;
        if (!string.IsNullOrEmpty(update.UserType)) user.UserType = update.UserType;

        await _dbContext.SaveChangesAsync();
    }

    public async Task MarkNotificationAsReadAsync(int notificationId)
    {
        var notification = await _dbContext.Notifications.FindAsync(notificationId);
        if (notification != null)
        {
            notification.IsRead = true;
            await _dbContext.SaveChangesAsync();
        }
    }
}