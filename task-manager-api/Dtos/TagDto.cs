using System;
using System.Collections.Generic;

namespace TaskManagerServer.Dtos
{
    public class TagDto
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int? PriorityID { get; set; }
        public int? ParentTagID { get; set; }
        public int UserID { get; set; }
        public string Color { get; set; }
    }
}
