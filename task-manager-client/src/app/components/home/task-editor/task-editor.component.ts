import { Component, OnInit } from '@angular/core';
import { TaskService } from '../../../services/task.service';
import { User } from '../../../models/user';
import { Task } from '../../../models/task';
import { UserDataService } from '../../../services/app/user-data.service';
import { NgForm } from '@angular/forms';
import { HomeTasksComponent } from '../home-tasks/home-tasks.component';
import { RegistersListComponent } from '../registers-list/registers-list.component';

@Component({
  selector: 'app-task-editor',
  templateUrl: './task-editor.component.html',
  styleUrls: ['./task-editor.component.sass']
})
export class TaskEditorComponent implements OnInit {
  private model: any = {};
  private loading: boolean = false;

  constructor(
    private userDataService: UserDataService, 
    private taskService: TaskService,
    private homeTasks: HomeTasksComponent,
    private registersList: RegistersListComponent) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if(form != null)
      form.reset();
      this.userDataService.selectedTask = new Task();
  }

  onSubmit(form: NgForm) {
    console.log(form.value);
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    form.value.userID = userIndex;
    if(form.value.id == null) {
      console.log("Dodaję");
      this.addTask(form.value);
    } else {
      console.log("Aktualizuję");
      this.updateTask(form.value);
    }
  }

  updateTask(model) {
    this.taskService.update(model).subscribe(add => { this.homeTasks.loadTasks(), this.resetForm() } );
  }

  addTask(task: Task) {
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    task.UserID = userIndex;
    this.taskService.create(task).subscribe(add => { this.homeTasks.loadTasks(), this.resetForm() } );
  }
}
