using TaskManagerServer.Services.Interfaces;
using TaskManagerServer.Helpers;
using System.Linq;
using System;
using TaskManagerServer.Entities;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;

namespace TaskManagerServer.Services
{
    public class QuoteService : IQuoteService
    {
        public DataContext _ctx;

        public QuoteService(DataContext ctx) 
        {
            _ctx = ctx;
        }
        public Quote GetByID(int id) 
        {
            // Raw SQL - for university class purpose
            var query = @"SELECT * FROM dbo.Quotes WHERE ID = @ID";
            var quote = _ctx.Quotes.FromSql(query, new SqlParameter("@ID", id)).SingleOrDefault();

            // LINQ
            //var quote = _ctx.Quotes.Find(id);
            return quote;
        }

        public Quote GetRandom()
        {
            var query = @"SELECT TOP 1 * FROM dbo.Quotes ORDER BY NEWID()";
            var quote = _ctx.Quotes.FromSql(query).SingleOrDefault();
            return quote;
        }
    }
}