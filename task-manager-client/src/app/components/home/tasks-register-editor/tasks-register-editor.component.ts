import { Component, OnInit } from '@angular/core';
import { UserDataService } from '../../../services/app/user-data.service';
import { TasksRegisterService } from '../../../services/tasks-register.service';

@Component({
  selector: 'app-tasks-register-editor',
  templateUrl: './tasks-register-editor.component.html',
  styleUrls: ['./tasks-register-editor.component.sass']
})
export class TasksRegisterEditorComponent implements OnInit {
  private loading: boolean = true;
  model: any = {};
  constructor(private userDataService: UserDataService, private tasksRegisterService: TasksRegisterService) { }

  ngOnInit() {
  }

  addTasksRegister() {
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    this.model.UserID = userIndex;
    this.tasksRegisterService.create(this.model);
    
  }

  updateTask() {

  }

}
