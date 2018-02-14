using System;
using System.Collections.Generic;

namespace TaskManagerServer.Entities
{
    public class Task
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int? TaskRegisterID { get; set; }
        public DateTime? Deadline { get; set; }
        public DateTime DateOfCreation { get; set; }
        public bool IsDone { get; set; }
        public bool Reminder { get; set; }
        public bool IsInArchive { get; set; }
        public int UserID { get; set; }
        public IEnumerable<Tag> Tags { get; set; }
    }
}