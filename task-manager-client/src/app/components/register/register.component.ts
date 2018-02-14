import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../services/authentication.service';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';
import { AlertService } from '../../services/alert.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.sass']
})
export class RegisterComponent implements OnInit {
  private model: any = {};
  private loading: boolean = false;
  constructor(
    private userService: UserService,
    private alertService: AlertService,
    private router: Router
  ) { }

  ngOnInit() {
    
  }

  register() {
    this.loading = true;
    console.log(this.model);
    this.userService.create(this.model)
    .subscribe(
      data => {
        this.alertService.success('Registration successed!', true);
        this.router.navigate(['/login']);
      },
      error => {
        this.alertService.error(error._body);
        this.loading = false;
      }
    );
  }
}

