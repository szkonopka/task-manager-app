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
    public class TagController : Controller
    {
        private ITagService _tagService;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public TagController(ITagService tagService, IMapper mapper, IOptions<AppSettings> appSettings) {
            _tagService = tagService;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpPost("create")]
        public IActionResult Create([FromBody] TagDto tagDto) {
            var tag = _mapper.Map<Entities.Tag>(tagDto);

            try 
            {
                _tagService.Create(tag);
                return Ok();
            } 
            catch(ApiException ex) 
            {
                return BadRequest(ex.Message);
            }
        }
        
        [HttpGet("{userId}")]
        public IActionResult GetAll(int userId) {
            var tags = _tagService.GetAll(userId);
            return Ok(tags);
        }

        [HttpGet("{userId}/{id}")]
        public IActionResult GetByID(int userId, int id) {
            var tag = _tagService.GetByID(userId, id);
            return Ok(tag);
        }

        [HttpPut("{userId}/{id}")]
        public IActionResult Update([FromBody] TagDto tagDto) {
            var tag = _mapper.Map<Entities.Tag>(tagDto);
            tag.ID = tagDto.ID;
            
            try
            {
                _tagService.Update(tag);
                return Ok();
            }
            catch(ApiException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{userId}/{id}")]
        public IActionResult Delete(int userId, int id) {
            _tagService.Delete(userId, id);
            return Ok();
        }
    }
}