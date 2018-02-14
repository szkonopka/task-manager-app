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
    [Route("user/[controller]")]
    public class TasksRegisterController : Controller
    {
        private ITasksRegisterService _tasksRegisterService;
        private IMapper _mapper;
        private AppSettings _appSettings;

        public TasksRegisterController(ITasksRegisterService tasksRegisterService, IMapper mapper, IOptions<AppSettings> appSettings)
        {
            _tasksRegisterService = tasksRegisterService;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpPost("create")]
        public IActionResult Create([FromBody] TasksRegisterDto tasksRegisterDto)
        {
            var tasksRegister = _mapper.Map<TasksRegister>(tasksRegisterDto);
            try
            {
                _tasksRegisterService.Create(tasksRegister);
                return Ok();
            }
            catch(ApiException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{userId}")]
        public IActionResult GetAll(int userId)
        {
            var tasksRegister = _tasksRegisterService.GetAll(userId);
            return Ok(tasksRegister);
        }

        [HttpPut("{userId}/{id}")]
        public IActionResult Update([FromBody] TasksRegisterDto tasksRegisterDto)
        {
            var tasksRegister = _mapper.Map<TasksRegister>(tasksRegisterDto);
            tasksRegister.ID = tasksRegisterDto.ID;

            try
            {
                _tasksRegisterService.Update(tasksRegister);
                return Ok();
            }
            catch(ApiException ex)
            {
                return BadRequest(ex.Message);
            }

            
        }

        [HttpDelete("{userId}/{id}")]
        public IActionResult Delete(int userId, int id)
        {
            _tasksRegisterService.Delete(userId, id);
            return Ok();
        }
    }
}