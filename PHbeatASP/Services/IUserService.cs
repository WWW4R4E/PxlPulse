using Microsoft.EntityFrameworkCore;
using PHbeatASP.Models.ApiModels;
using PHbeatASP.Models.DbModels;

namespace PHbeatASP.Services;

public interface IUserService
{
    Task<LoveUser> GetUserProfileAsync(string userId);
    Task UpdateUserProfileAsync(string userId, UserProfileUpdate update);
    Task MarkNotificationAsReadAsync(string notificationId);
}

public class UserService : IUserService
{
    private readonly LoveDbContext _dbContext;

    public UserService(LoveDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<LoveUser> GetUserProfileAsync(string userId)
    {
        return (await _dbContext.Users
            .Include(u => u.Notifications)
            .FirstOrDefaultAsync(u => u.Id == userId))!;
    }


    public async Task UpdateUserProfileAsync(string userId, UserProfileUpdate update)
    {
        var user = await _dbContext.Users.FindAsync(userId);
        if (user == null) throw new ArgumentException("User not found");
        if (!string.IsNullOrEmpty(update.Username)) user.UserName = update.Username;
        if (!string.IsNullOrEmpty(update.Email)) user.Email = update.Email;
        if (!string.IsNullOrEmpty(update.PhoneNumber)) user.PhoneNumber = update.PhoneNumber;
        if (update.Birthday.HasValue) user.Birthday = update.Birthday.Value;
        if (!string.IsNullOrEmpty(update.Avatar)) user.Avatar = update.Avatar;
        if (update.Gender.HasValue) user.Gender = update.Gender.Value;
        if (!string.IsNullOrEmpty(update.UserType)) user.UserType = update.UserType;

        await _dbContext.SaveChangesAsync();
    }

    public async Task MarkNotificationAsReadAsync(string notificationId)
    {
        var notification = await _dbContext.Notifications.FindAsync(notificationId);
        if (notification != null)
        {
            notification.IsRead = true;
            await _dbContext.SaveChangesAsync();
        }
    }
}