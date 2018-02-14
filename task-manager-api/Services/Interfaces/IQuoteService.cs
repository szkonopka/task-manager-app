using TaskManagerServer.Entities;

namespace TaskManagerServer.Services.Interfaces
{
    public interface IQuoteService
    {
        Quote GetByID(int id);
        Quote GetRandom();
    }
}