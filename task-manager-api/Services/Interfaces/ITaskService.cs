using TaskManagerServer.Entities;
using System.Collections.Generic;

namespace TaskManagerServer.Services.Interfaces
{
    public interface ITaskService
    {
        Task Create(Task task);
        IEnumerable<Task> GetAll(int userId);
        IEnumerable<Task> GetTasksWithTags(int userId);
        Task GetByID(int userId, int id);
        void Update(Task task);
        void Delete(int userId, int id);
    }
}