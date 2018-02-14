import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { AppConfig } from '../config/app.config';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Response } from '@angular/http';

@Injectable()
export class AuthenticationService {

  constructor(private http: Http, private appConfig: AppConfig) { }

  login(username: string, password: string) {
    return this.http.post(this.appConfig.apiUrl + '/users/authenticate', { username: username, password: password })
    .map((response: Response) => {
      let user = response.json();
      if(user && user.token) {
        localStorage.setItem('currentUser', JSON.stringify(user));
      }
    });
  }

  logout() {
    localStorage.removeItem('currentUser');
  }

}
