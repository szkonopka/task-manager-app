using AutoMapper;
using TaskManagerServer.Dtos;
using TaskManagerServer.Entities;

namespace TaskManagerServer.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();

            CreateMap<Task, TaskDto>();
            CreateMap<TaskDto, Task>();

            CreateMap<TasksRegister, TasksRegisterDto>();
            CreateMap<TasksRegisterDto, TasksRegister>();

            CreateMap<Tag, TagDto>();
            CreateMap<TagDto, Tag>();
        }
    }
}