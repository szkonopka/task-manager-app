using System.Collections.Generic;
using TaskManagerServer.Entities;

namespace TaskManagerServer.Services.Interfaces
{
    public interface IUserService
    {
        User Authenticate(string username, string password);
        User Create(User user, string password);
        IEnumerable<User> GetAll();
        User GetByID(int id);
        void Update(User user, string password = null);
        void Delete(int id);
    }
}