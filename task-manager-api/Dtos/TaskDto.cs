using System;

namespace TaskManagerServer.Dtos
{
    public class TaskDto
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
        public TagDto[] Tags { get; set; }
    }
}