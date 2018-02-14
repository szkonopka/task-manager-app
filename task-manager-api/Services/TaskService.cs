using System.Collections.Generic;
using TaskManagerServer.Services.Interfaces;
using TaskManagerServer.Entities;
using TaskManagerServer.Helpers;
using System.Linq;
using System;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace TaskManagerServer.Services
{
    public class TaskService : ITaskService
    {
        private DataContext _ctx;

        public TaskService(DataContext ctx) 
        {
            _ctx = ctx;
        }

        public Task Create(Task task) 
        {
            // Raw SQL command - for university class purpose
            if(task.Deadline == null && task.TaskRegisterID == null) 
            {
                var query = @"INSERT INTO dbo.Tasks(Name, UserID) VALUES (@Name, @UserID);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", task.Name),
                new SqlParameter("@UserID", task.UserID));    
            }
            else if(task.TaskRegisterID == null) 
            {
                var query = @"INSERT INTO dbo.Tasks(Name, Deadline, UserID) VALUES (@Name, @Deadline, @UserID);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", task.Name),
                new SqlParameter("@Deadline", task.Deadline),
                new SqlParameter("@UserID", task.UserID));
            }
            else if(task.Deadline == null)
            {
                var query = @"INSERT INTO dbo.Tasks(Name, UserID, TaskRegisterID) VALUES (@Name, @UserID, @TaskRegisterID);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", task.Name),
                new SqlParameter("@UserID", task.UserID),
                new SqlParameter("@TaskRegisterID", task.TaskRegisterID));    
            } 
            else
            {
                var query = @"INSERT INTO dbo.Tasks(Name, Deadline, UserID, TaskRegisterID) VALUES (@Name, @Deadline, @UserID, @TaskRegisterID);";
                _ctx.Database.ExecuteSqlCommand
                (query, 
                new SqlParameter("@Name", task.Name),
                new SqlParameter("@Deadline", task.Deadline),
                new SqlParameter("@UserID", task.UserID),
                new SqlParameter("@TaskRegisterID", task.TaskRegisterID));    
            }
            
            // LINQ
            //_ctx.Tasks.Add(task);
            _ctx.SaveChanges();
            return task;
        }

        public IEnumerable<Task> GetAll(int userId) 
        {
            // Raw SQL command - for university class purpose
            var query = @"SELECT * FROM dbo.Tasks WHERE UserID = @UserID;";
            var userTasks = _ctx.Tasks.FromSql(query, new SqlParameter("@UserId", userId));

            foreach(Task task in userTasks)
            {
                query = @"SELECT * FROM dbo.TasksTagsMap WHERE TaskID = @TaskID;";
                task.Tags = _ctx.Tags.FromSql(query, new SqlParameter("@TaskID", task.ID)).ToArray();
            }

            // LINQ
            //var userTasks = _ctx.Tasks.Where(t => t.UserID == userId).OrderBy(t => t.Deadline);

            return userTasks;
        }

        public IEnumerable<Task> GetTasksWithTags(int userId) 
        {
            // Raw SQL command - for university class purpose
            var query = @"SELECT * FROM dbo.TasksWithTags WHERE UserID = @UserID";
            var taggedUserTasks = _ctx.Tasks.FromSql(query, new SqlParameter("@UserID", userId));

            return taggedUserTasks;
        }

        public Task GetByID(int userId, int id) 
        {
            var task = _ctx.Tasks.Where(t => t.UserID == userId).SingleOrDefault(ut => ut.ID == id);
            return task;
            
        }
        
        public void Update(Task task) 
        {
            var taskToUpdate = _ctx.Tasks.Where(t => t.UserID == task.UserID).SingleOrDefault(ut => ut.ID == task.ID);
            
            if(taskToUpdate == null)
                throw new ApiException("No tasks indexed " + task.ID);

            taskToUpdate.Name = task.Name;
            taskToUpdate.TaskRegisterID = task.TaskRegisterID;
            taskToUpdate.Deadline = task.Deadline;
            taskToUpdate.IsDone = task.IsDone;
            taskToUpdate.Reminder = task.Reminder;
            taskToUpdate.IsInArchive = task.IsInArchive;

            _ctx.Tasks.Update(taskToUpdate);
            _ctx.SaveChanges();
        }

        public void Delete(int userId, int id) 
        {
            // Raw SQL - for university class purpose
            var query = @"DELETE FROM dbo.Tasks WHERE ID IN (SELECT ID FROM dbo.Tasks WHERE UserID = @UserId) AND ID = @ID;";
            _ctx.Database.ExecuteSqlCommand
            (query, 
            new SqlParameter("@UserID", userId),
            new SqlParameter("@ID", id)
            );
            _ctx.SaveChanges();

            // LINQ
            /*var tasks = _ctx.Tasks.Where(t => t.UserID == userId);
            var task = tasks.FirstOrDefault(t => t.ID == id);
            if(task != null) {
                _ctx.Tasks.Remove(task);
                _ctx.SaveChanges();
            }*/
        }
    }
}