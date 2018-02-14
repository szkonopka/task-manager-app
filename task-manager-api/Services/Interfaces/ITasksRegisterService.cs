using System.Collections.Generic;
using TaskManagerServer.Entities;

namespace TaskManagerServer.Services.Interfaces
{
    public interface ITasksRegisterService
    {
        TasksRegister Create(TasksRegister tasksRegister);
        IEnumerable<TasksRegister> GetAll(int userId);
        TasksRegister GetByID(int userId, int id);
        void Update(TasksRegister tasksRegister);
        void Delete(int userId, int id);
    }
}