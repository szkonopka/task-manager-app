import { Injectable } from '@angular/core';
import { TaskService } from '../task.service';
import { UserService } from '../user.service';
import { Task } from '../../models/task';
import { User } from '../../models/user';
import { forEach } from '@angular/router/src/utils/collection';
import { Subject } from 'rxjs/Subject';
import { Observable } from 'rxjs/Observable';
import { TasksRegister } from '../../models/tasks-register';
import { TasksRegisterService } from '../tasks-register.service';

@Injectable()
export class UserDataService {
  currentUser: User;
  
  taskEditorVisibility: boolean = false;
  tasksRegisterEditorVisibility: boolean = false;
  editorOn: boolean = false;

  public selectedTask: Task;
  archive: boolean = false;
  done: boolean = false;
  contenerLabel: string = "";
  currentRegister: number = null;

  constructor(
    private userService: UserService,
    private taskService: TaskService,
    private tasksRegisterService: TasksRegisterService 
  ) { 
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  changeEditorVisibility(editor: string) {
    if(editor === 'task') {
      this.taskEditorVisibility = true;
      this.tasksRegisterEditorVisibility = false;
    } else if(editor === 'taskRegister') {
      this.tasksRegisterEditorVisibility = true;
      this.taskEditorVisibility = false;
    } else {
      this.taskEditorVisibility = false;
      this.tasksRegisterEditorVisibility = false;
    }
    this.editorOn = !this.editorOn;
  }

  filterAllTasks() {
    this.contenerLabel = "Nadchodzące zadania";
    this.currentRegister = null;
    this.archive = false;
    this.done = false;
  }

  filterDoneTasks() {
    this.contenerLabel = "Wykonane";
    this.currentRegister = null;
    this.done = true;
  }

  filterArchivizedTasks() {
    this.contenerLabel = "Archiwum";
    this.currentRegister = null;
    this.archive = true;
    this.done = false;
  }

  filterRegisterTasks(register: TasksRegister) {
    this.contenerLabel = register['name'];
    this.currentRegister = register['id'];
    this.archive = false;
    this.done = false;
  }
}
