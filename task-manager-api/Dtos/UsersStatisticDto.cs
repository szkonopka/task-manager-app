namespace TaskManagerServer.Dtos
{
    public class UsersStatisticDto
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int UpcomingTasks { get; set; }
        public int TotalTasksDone { get; set; }
        public int TotalCoffeeAmount { get; set; }
    }
}