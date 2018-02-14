using System;

namespace TaskManagerServer.Entities
{
    public class DailyStatistic
    {
        public int ID { get; set; }
        public DateTime DateStamp { get; set; }
        public int CoffeeAmount { get; set; }
        public long TimeOnProjects { get; set; }
        public int TasksDone { get; set; }
        public int DailyTasksAmount { get; set; }
    }
}