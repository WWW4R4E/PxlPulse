using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace PHbeatASP.Models.DbModels;

public class LoveDbContext : IdentityDbContext<LoveUser, IdentityRole, string>
{
    public DbSet<LoveUser> Users { get; set; }
    public DbSet<AiCharacter> AiCharacters { get; set; }
    public DbSet<LoveInteraction> LoveInteractions { get; set; }
    public DbSet<LoveDiary> LoveDiaries { get; set; }
    public DbSet<SocialPost> SocialPosts { get; set; }
    public DbSet<Membership> Memberships { get; set; }
    public DbSet<Notification> Notifications { get; set; }
    public DbSet<IdentityRole> Roles { get; set; }

    public LoveDbContext(DbContextOptions<LoveDbContext> options) : base(options)
    {
    }
    

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        
        // LoveUser 配置
        modelBuilder.Entity<IdentityUserLogin<string>>().HasKey(u => u.UserId);
        modelBuilder.Entity<IdentityUserRole<string>>().HasKey(r => new { r.UserId, r.RoleId });
        modelBuilder.Entity<IdentityUserClaim<string>>().HasKey(c => c.Id);
        modelBuilder.Entity<IdentityUserToken<string>>().HasKey(t => new { t.UserId, t.LoginProvider, t.Name });

        modelBuilder.Entity<LoveUser>()
            .HasKey(u => u.Id);

        modelBuilder.Entity<LoveUser>()
            .HasMany(u => u.AICharacters)
            .WithOne(c => c.Creator)
            .HasForeignKey(c => c.CreatorId);

        modelBuilder.Entity<LoveUser>()
            .HasMany(u => u.LoveInteractions)
            .WithOne(i => i.User)
            .HasForeignKey(i => i.UserId);

        modelBuilder.Entity<LoveUser>()
            .HasMany(u => u.LoveDiaries)
            .WithOne(d => d.User)
            .HasForeignKey(d => d.UserId);

        modelBuilder.Entity<LoveUser>()
            .HasMany(u => u.SocialPosts)
            .WithOne(p => p.User)
            .HasForeignKey(p => p.UserId);

        modelBuilder.Entity<LoveUser>()
            .HasMany(u => u.Memberships)
            .WithOne(m => m.User)
            .HasForeignKey(m => m.UserId);
        
        // 角色种子数据
        modelBuilder.Entity<IdentityRole>().HasData(
            new IdentityRole { Id = "1", Name = "普通用户", NormalizedName = "普通用户" },
            new IdentityRole { Id = "2", Name = "会员用户", NormalizedName = "会员用户" },
            new IdentityRole { Id = "3", Name = "管理员", NormalizedName = "管理员" }
        );

        // AICharacter 配置
        modelBuilder.Entity<AiCharacter>()
            .HasKey(c => c.CharacterId);

        // LoveInteraction 配置
        modelBuilder.Entity<LoveInteraction>()
            .HasKey(i => i.InteractionId);

        modelBuilder.Entity<LoveInteraction>()
            .HasOne(i => i.User)
            .WithMany(u => u.LoveInteractions)
            .HasForeignKey(i => i.UserId);

        // LoveDiary 配置
        modelBuilder.Entity<LoveDiary>()
            .HasKey(d => d.DiaryId);

        modelBuilder.Entity<LoveDiary>()
            .HasOne(d => d.User)
            .WithMany(u => u.LoveDiaries)
            .HasForeignKey(d => d.UserId);

        modelBuilder.Entity<LoveDiary>()
            .HasOne(d => d.Character)
            .WithMany()
            .HasForeignKey(d => d.CharacterId);

        modelBuilder.Entity<LoveDiary>()
            .Property(d => d.DiaryTitle)
            .HasMaxLength(500);

        modelBuilder.Entity<LoveInteraction>()
            .Property(i => i.InteractionContent)
            .HasMaxLength(1000);


        // SocialPost 配置
        modelBuilder.Entity<SocialPost>()
            .HasKey(p => p.PostId);

        modelBuilder.Entity<SocialPost>()
            .HasOne(p => p.User)
            .WithMany(u => u.SocialPosts)
            .HasForeignKey(p => p.UserId);

        // Membership 配置
        modelBuilder.Entity<Membership>()
            .HasKey(m => m.MembershipId);

        modelBuilder.Entity<Membership>()
            .HasOne(m => m.User)
            .WithMany(u => u.Memberships)
            .HasForeignKey(m => m.UserId);

        // 新增通知配置
        modelBuilder.Entity<Notification>()
            .HasKey(n => n.NotificationId);
            
        modelBuilder.Entity<Notification>()
            .HasOne(n => n.User)
            .WithMany(u => u.Notifications)
            .HasForeignKey(n => n.UserId);
    }
}