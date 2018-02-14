import { Component, OnInit } from '@angular/core';
import { UserDataService } from '../../services/app/user-data.service';
import { HomeTasksComponent } from '../home/home-tasks/home-tasks.component';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.sass']
})
export class UserProfileComponent implements OnInit {
  
  constructor(
    private userDataService: UserDataService,
    private homeTasks: HomeTasksComponent) { }

  ngOnInit() {
  }

}
