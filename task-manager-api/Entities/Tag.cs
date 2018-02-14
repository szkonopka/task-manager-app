namespace TaskManagerServer.Entities
{
    public class Tag
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int? PriorityID { get; set; }
        public int? ParentTagID { get; set; }
        public int UserID { get; set; }
        public string Color { get; set; }
    } 
}
