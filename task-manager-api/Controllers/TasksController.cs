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
    //[Authorize]
    [Route("user/[controller]")]
    public class TasksController : Controller
    {
        private ITaskService _taskService;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public TasksController(ITaskService taskService, IMapper mapper, IOptions<AppSettings> appSettings) {
            _taskService = taskService;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        [HttpPost("create")]
        public IActionResult Create([FromBody] TaskDto taskDto) {
            var task = _mapper.Map<Task>(taskDto);
            Console.WriteLine(task.Name);
            Console.WriteLine(task.Deadline);
            Console.WriteLine(task.UserID);
            Console.WriteLine(task.TaskRegisterID);
            try 
            {
                _taskService.Create(task);
                return Ok();
            } 
            catch(ApiException ex) 
            {
                return BadRequest(ex.Message);
            }
        }
        
        [HttpGet("{userId}")]
        public IActionResult GetAll(int userId) {
            var tasks = _taskService.GetAll(userId);
            return Ok(tasks);
        }
        
        [HttpGet("{userId}/tagged")]
        public IActionResult GetTagged(int userId)
        {
            var tasks = _taskService.GetTasksWithTags(userId);
            return Ok(tasks);
        }

        [HttpGet("{userId}/{id}")]
        public IActionResult GetByID(int userId, int id) {
            var task = _taskService.GetByID(userId, id);
            return Ok(task);
        }

        [HttpPut("{userId}/{id}")]
        public IActionResult Update([FromBody] TaskDto taskDto) {
            Console.WriteLine("Updating task");
            var task = _mapper.Map<Task>(taskDto);
            task.ID = taskDto.ID;
            
            try
            {
                _taskService.Update(task);
                return Ok();
            }
            catch(ApiException ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{userId}/{id}")]
        public IActionResult Delete(int userId, int id) {
            Console.WriteLine("Deleting task");
            _taskService.Delete(userId, id);
            return Ok();
        }
    }
}