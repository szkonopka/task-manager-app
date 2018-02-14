using System;

namespace TaskManagerServer.Entities
{
    public class TasksRegister
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int UserID { get; set; }
        public DateTime? Deadline {   get; set; }
        public DateTime DateOfCreation { get; set; }
        public bool IsInArchive { get; set; }
        
    }
}