using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using TaskManagerServer.Services;
using TaskManagerServer.Services.Interfaces;
using TaskManagerServer.Helpers;
using TaskManagerServer.Entities;
using TaskManagerServer.Dtos;
using Microsoft.Extensions.Options;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using AutoMapper;

namespace TaskManagerServer.Controllers
{
    [Route("[controller]")]
    public class QuoteController : Controller
    {
        private IQuoteService _quoteService;
        private IMapper _mapper;
        private AppSettings _appSettings;

        public QuoteController(IQuoteService quoteService, IMapper mapper, IOptions<AppSettings> appSettings)
        {
            _quoteService = quoteService;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpGet("{id}")]
        public Quote GetByID(int id) 
        {   
            var quote = _quoteService.GetByID(id);
            return quote;
        }

        [HttpGet("random")]
        public Quote GetRandom()
        {
            var quote = _quoteService.GetRandom();
            return quote;
        }
    }
}