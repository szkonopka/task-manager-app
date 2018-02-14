import { Component, OnInit, OnChanges } from '@angular/core';
import { UserDataService } from '../../../services/app/user-data.service';
import { Task } from '../../../models/task';
import { TaskService } from '../../../services/task.service';
import { TasksRegister } from '../../../models/tasks-register';
import { HomeComponent } from '../home.component';

@Component({
  selector: 'app-home-tasks',
  templateUrl: './home-tasks.component.html',
  styleUrls: ['./home-tasks.component.sass']
})
export class HomeTasksComponent implements OnInit {

  public userTasks: Task[];
  public userTasksRegisters: TasksRegister[];
  constructor(
    private userDataService: UserDataService, 
    private taskService: TaskService) { 
  }

  ngOnInit() {
    this.loadTasks();  
    this.userDataService.filterAllTasks();
  }

  loadTasks() {
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    this.taskService.getAll(userIndex).toPromise().then(x => {
      this.userTasks = x;
    });
  }

  setTaskStatus(task: Task) {
    setTimeout(() => {
      //var taskArchiveStatus: boolean = task['isInArchive'];
      var taskIsDoneStatus: boolean = task['isDone'];
      //task.IsInArchive = !taskArchiveStatus;
      task.IsDone = !taskIsDoneStatus;
      this.taskService.update(task).subscribe(upt => this.loadTasks());
      
    }, 500);
  }

  showTaskForEdit(task: Task) {
    this.userDataService.selectedTask = Object.assign({}, task);
  }

  onDelete(task: Task) {
    if(confirm("Jesteś pewien?") == true) {
      this.taskService.delete(task['userID'], task['id']).subscribe(del => this.loadTasks());
      this.loadTasks();
    }
  }

  ngOnChanges(changes: any) {
    var userIndex = parseInt(JSON.stringify(this.userDataService.currentUser['id']));
    this.taskService.getAll(userIndex).subscribe((tasks: Task[]) => { this.loadTasks()});
  }
}
