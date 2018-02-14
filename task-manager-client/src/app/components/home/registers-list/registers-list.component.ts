import { Component, OnInit } from '@angular/core';
import { UserDataService } from '../../../services/app/user-data.service';
import { TasksRegisterService } from '../../../services/tasks-register.service';
import { TasksRegister } from '../../../models/tasks-register';

@Component({
  selector: 'app-registers-list',
  templateUrl: './registers-list.component.html',
  styleUrls: ['./registers-list.component.sass']
})
export class RegistersListComponent implements OnInit {

  userTasksRegisters: TasksRegister[];
  constructor(private userDataService: UserDataService, private tasksRegisterService: TasksRegisterService) { }

  ngOnInit() {
    this.loadRegisters();
  }

  loadRegisters() {
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    this.tasksRegisterService.getAll(userIndex).toPromise().then(x => {
      this.userTasksRegisters = x;
    });
  }
}
