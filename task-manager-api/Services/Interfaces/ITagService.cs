using System.Collections.Generic;
using TaskManagerServer.Entities;

namespace TaskManagerServer.Services.Interfaces
{
    public interface ITagService
    {
        Tag Create(Tag tasksTag);
        IEnumerable<Tag> GetAll(int userId);
        Tag GetByID(int userId, int tagId);
        void Update(Tag tasksTag);
        void Delete(int userId, int tagId);
    }
}