using System;
using System.Linq;
using System.Collections.Generic;
using TaskManagerServer.Entities;
using TaskManagerServer.Helpers;
using TaskManagerServer.Dtos;
using TaskManagerServer.Services.Interfaces;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace TaskManagerServer.Services
{
    public class UserService : IUserService
    {
        private DataContext _ctx;
        
        public UserService(DataContext ctx) 
        {
            _ctx = ctx;
        }

        public User Authenticate(string username, string password)
        {
            if(string.IsNullOrEmpty(password) || string.IsNullOrEmpty(username))
                return null;

            var query = @"SELECT * FROM dbo.Users WHERE Username = @Username";
            var user = _ctx.Users.FromSql(query, new SqlParameter("@Username", username)).SingleOrDefault();

            // LINQ
            //var user = _ctx.Users.SingleOrDefault(u => u.Username == username);
            
            if(user == null)
                return null;

            if(!VerifyPassword(password, user.PasswordHash, user.PasswordSalt))
                return null;
            
            return user;
        }
        public User Create(User user, string password)
        {
            if(string.IsNullOrWhiteSpace(password))
                throw new ApiException("Password is required!");

            if(_ctx.Users.Any(u => u.Username == user.Username))
                throw new ApiException("Username " + user.Username + " is already taken!");

            byte[] passwordHash, passwordSalt;
            CreatePasswordHash(password, out passwordHash, out passwordSalt);

            user.PasswordHash = passwordHash;
            user.PasswordSalt = passwordSalt;
            
            // Raw SQL - for university class purpose
            var query = @"INSERT INTO dbo.Users(FirstName, LastName, Username, Email, PasswordHash, PasswordSalt) VALUES
            (@FirstName, @LastName, @Username, @Email, @PasswordHash, @PasswordSalt);";
            _ctx.Database.ExecuteSqlCommand
            (query,
            new SqlParameter("@FirstName", user.FirstName),
            new SqlParameter("@LastName", user.LastName),
            new SqlParameter("@Username", user.Username),
            new SqlParameter("@Email", user.Email),
            new SqlParameter("@PasswordHash", user.PasswordHash),
            new SqlParameter("@PasswordSalt", user.PasswordSalt)
            );

            // LINQ
            //_ctx.Users.Add(user);

            _ctx.SaveChanges();
            return user;
        }
        public IEnumerable<User> GetAll()
        {
            // Raw SQL - for university class purpose
            var query = "SELECT * FROM dbo.Users";
            var users = _ctx.Users.FromSql(query);

            // LINQ
            //var users = _ctx.Users;
            return users;
        }
        public User GetByID(int id)
        {
            var user = _ctx.Users.Find(id);
            return user;
        }
        public void Update(User user, string password = null)
        {
            var userToUpdate = _ctx.Users.Find(user.ID);
            
            if(userToUpdate == null)
                throw new ApiException("No user named " + userToUpdate.Username);

    
            if(userToUpdate.Username != user.Username)
            {
                if(_ctx.Users.Any(u => u.Username == user.Username))
                    throw new ApiException("Username " + user.Username + " is already taken.");
            }

            if(!string.IsNullOrWhiteSpace(password))
            {
                byte[] passwordHash, passwordSalt;
                CreatePasswordHash(password, out passwordHash, out passwordSalt);

                user.PasswordHash = passwordHash;
                user.PasswordSalt = passwordSalt;
            }

            userToUpdate.FirstName = user.FirstName;
            userToUpdate.LastName = user.LastName;
            userToUpdate.Username = user.Username;
            userToUpdate.Email = user.Email;
            
            _ctx.Users.Update(userToUpdate);

            _ctx.SaveChanges();
        }
        public void Delete(int id)
        {
            var user = _ctx.Users.Find(id);
            if(user != null)
            {
                _ctx.Users.Remove(user);
                _ctx.SaveChanges();
            }
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            if(password == null) throw new ArgumentNullException("password");
            if(string.IsNullOrWhiteSpace(password)) throw new ArgumentException("Value cannot be empty or whitespace, string is required.", "password");
            
            using(var hmac = new System.Security.Cryptography.HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }
        private Boolean VerifyPassword(string password, byte[] passwordHash, byte[] passwordSalt) 
        {
            Console.WriteLine("Checking password...");
            if(password == null) throw new ArgumentNullException("password");
            if(string.IsNullOrWhiteSpace(password)) throw new ArgumentException("Value cannot be empty or whitespace, string is required.", "password");
            if(passwordHash.Length != 64) throw new ArgumentException("Invalid length of password hash (64 bytes required).", "passwordHash");
            if(passwordSalt.Length != 128) throw new ArgumentException("Invalid length of password salt (128 bytes required).", "passwordSalt");

            using(var hmac = new System.Security.Cryptography.HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                for(int i = 0; i < passwordHash.Length; i++)
                {
                    if(passwordHash[i] != computedHash[i])
                        return false;
                }
            }
            return true;
        }
    }
}