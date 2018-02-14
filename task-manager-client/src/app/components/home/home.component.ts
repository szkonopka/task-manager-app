import { Component, OnInit } from '@angular/core';
import { Task } from '../../models/task';
import { User } from '../../models/user';
import { TaskService } from '../../services/task.service';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';
import { forEach } from '@angular/router/src/utils/collection';
import { UserDataService } from '../../services/app/user-data.service';
import { TaskEditorComponent } from './task-editor/task-editor.component';
import { HomeTasksComponent } from './home-tasks/home-tasks.component';
import { RegistersListComponent } from './registers-list/registers-list.component';
import { transition, state, animate, style, trigger } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.sass'],
  animations: [
    trigger('fadeInOut', [
      transition(':enter', [
        style({opacity: 0}),
        animate(5000, style({opacity: 1}))
      ]),
      transition(':leave', [
        animate(5000, style({opacity: 0}))
      ])
    ])
  ]
})
export class HomeComponent implements OnInit {
  
  constructor(
    private userDataService: UserDataService, 
    private router: Router,
    private taskEditor: TaskEditorComponent,
    private homeTasks: HomeTasksComponent,
    private registersList: RegistersListComponent
    
  ) 
  { }

  ngOnInit() {
    this.registersList.loadRegisters();
    this.homeTasks.loadTasks();
  }

  closeTaskEditor() {
    
  }
}
