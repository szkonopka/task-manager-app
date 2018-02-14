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
    public class UsersStatisticController : Controller
    {
        
    }
}