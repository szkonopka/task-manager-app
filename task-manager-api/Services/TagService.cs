using TaskManagerServer.Entities;
using TaskManagerServer.Helpers;
using TaskManagerServer.Services.Interfaces;
using System.Linq;
using System.Collections.Generic;

namespace TaskManagerServer.Services
{
    public class TagService : ITagService
    {
        private DataContext _ctx;

        public TagService(DataContext ctx) {
            _ctx = ctx;
        }

        public Tag Create(Tag tag) {
            _ctx.Tags.Add(tag);
            _ctx.SaveChanges();
            return tag;
        }

        public IEnumerable<Tag> GetAll(int userId) {
            var tags = _ctx.Tags.Where(t => t.UserID == userId);
            return tags;
        }
        
        public Tag GetByID(int userId, int tagId) {
            var tag = _ctx.Tags.Where(t => t.UserID == userId).SingleOrDefault(ut => ut.ID == tagId);
            return tag;
        }

        public void Update(Tag paramTag) {
            var tag = _ctx.Tags.Where(t => t.UserID == paramTag.UserID).SingleOrDefault(ut => ut.ID == paramTag.ID);
            if(tag == null)
                throw new ApiException("");
            
            tag.Name = paramTag.Name;
            tag.PriorityID = paramTag.PriorityID;
            tag.ParentTagID = paramTag.ParentTagID;

            _ctx.Tags.Update(tag);
            _ctx.SaveChanges();
        }

        public void Delete(int userId, int tagId) {
            var tag = _ctx.Tags.Where(t => t.UserID == userId).SingleOrDefault(ut => ut.ID == tagId);
            if(tag != null) {
                _ctx.Tags.Remove(tag);
                _ctx.SaveChanges();
            }
        }
    }
}