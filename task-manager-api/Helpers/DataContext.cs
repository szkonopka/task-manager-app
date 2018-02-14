using Microsoft.EntityFrameworkCore;
using TaskManagerServer.Entities;

namespace TaskManagerServer.Helpers
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options) {}
        public DbSet<User> Users { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<TasksRegister> TasksRegisters { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<Quote> Quotes { get; set; }
        public DbSet<TasksTag> TasksTags { get; set; }
    }
}