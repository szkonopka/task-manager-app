using TaskManagerServer.Services.Interfaces;
using TaskManagerServer.Entities;
using TaskManagerServer.Helpers;
using System.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace TaskManagerServer.Services
{
    public class TasksRegisterService : ITasksRegisterService
    {
        private DataContext _ctx;

        public TasksRegisterService(DataContext ctx)
        {
            _ctx = ctx;
        }

        public TasksRegister Create(TasksRegister tasksRegister)
        {   
            // Raw SQL - for university class purpose
            if(tasksRegister.Deadline == null) 
            {
                var query = @"INSERT INTO dbo.TasksRegisters(Name, UserID) VALUES(@Name, @UserID);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", tasksRegister.Name), 
                new SqlParameter("@UserID", tasksRegister.UserID));
            }
            else
            {
                var query = @"INSERT INTO dbo.TasksRegisters(Name, UserID, Deadline) VALUES(@Name, @UserID, @Deadline);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", tasksRegister.Name), 
                new SqlParameter("@UserID", tasksRegister.UserID),
                new SqlParameter("@Deadline", tasksRegister.Deadline));
            }

            // LINQ
            //_ctx.TasksRegisters.Add(tasksRegister);
            _ctx.SaveChanges();
            return tasksRegister;
        }
        public IEnumerable<TasksRegister> GetAll(int userId)
        {
            // Raw SQL - for university class purpose
            var query = @"SELECT * FROM dbo.TasksRegisters WHERE UserID = @UserID";
            var userTasksRegisters = _ctx.TasksRegisters.FromSql(query, new SqlParameter("@UserID", userId));

            // LINQ
            //var tasksRegisters = _ctx.TasksRegisters.Where(t => t.UserID == userId).OrderBy(t => t.Deadline);
            return userTasksRegisters;
        }
        public TasksRegister GetByID(int userId, int id)
        {
            var tasksRegister = _ctx.TasksRegisters.Where(t => t.UserID == userId).SingleOrDefault(ut => ut.ID == id);
            return tasksRegister;
        }

        public void Update(TasksRegister tasksRegister)
        {
            var tasksRegisterToUpdate = _ctx.TasksRegisters.Where(t => t.UserID == tasksRegister.UserID).SingleOrDefault(ut => ut.ID == tasksRegister.ID);

            if(tasksRegisterToUpdate == null)
                throw new ApiException("No tasks registers indexed " + tasksRegister.ID);

            tasksRegisterToUpdate.Name = tasksRegister.Name;
            tasksRegisterToUpdate.Deadline = tasksRegister.Deadline;
            tasksRegisterToUpdate.IsInArchive = tasksRegister.IsInArchive;
            
            _ctx.TasksRegisters.Update(tasksRegisterToUpdate);
            _ctx.SaveChanges();
        }

        public void Delete(int userId, int id)
        {
            var tasksRegisters = _ctx.TasksRegisters.Where(t => t.UserID == userId);
            var tasksRegister = tasksRegisters.FirstOrDefault(t => t.ID == id);
            if(tasksRegister != null)
            {
                _ctx.TasksRegisters.Remove(tasksRegister);
                _ctx.SaveChanges();
            }
        }
    }
}