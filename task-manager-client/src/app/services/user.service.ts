import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { AppConfig } from '../config/app.config';
import { User } from '../models/user';
import 'rxjs/add/operator/map';

@Injectable()
export class UserService {

  constructor(private http: Http, private appConfig: AppConfig) { }

  getAll() {
    return this.http.get(this.appConfig.apiUrl + '/users', this.jwt()).map((response: Response) => response.json());
  }

  getByID(id: number) {
    return this.http.get(this.appConfig.apiUrl + '/users/' + id, this.jwt()).map((response: Response) => response.json());
  } 

  create(user: User) {
    return this.http.post(this.appConfig.apiUrl + '/users/register', user, this.jwt());
  }

  update(id: number, user: User) {
    return this.http.put(this.appConfig.apiUrl + '/users/' + id, this.jwt());
  }

  delete(id: number) {
    return this.http.delete(this.appConfig.apiUrl + '/users/' + id, this.jwt());
  }

  private jwt() {
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if(currentUser && currentUser.token) {
      let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
      return new RequestOptions({ headers: headers });
    }
  }
}
