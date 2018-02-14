import { Injectable } from '@angular/core';
import { Http, Response, RequestOptions, Headers } from '@angular/http';
import { TasksRegister } from '../models/tasks-register';
import { AppConfig } from '../config/app.config';
import { Observable } from 'rxjs/Observable';

@Injectable()
export class TasksRegisterService {

  constructor(private http: Http, private appConfig: AppConfig) { }

  getAll(userId: number): Observable<TasksRegister[]>{
    return this.http.get(this.appConfig.apiUrl + '/user/tasksregister/' + userId, this.jwt()).map((response: Response) => response.json());
  }

  getByID(userId: number, id: number) {
    return this.http.get(this.appConfig.apiUrl + '/user/tasksregister/' + userId + '/' + id, this.jwt()).map((response: Response) => response.json());
  }

  create(tasksRegister: TasksRegister) {
    return this.http.post(this.appConfig.apiUrl + '/user/tasksregister/create', tasksRegister, this.jwt()).subscribe(x => {});
  }

  update(tasksRegister: TasksRegister) {
    return this.http.put(this.appConfig.apiUrl + '/user/tasksregister/' + tasksRegister.UserID + '/' + tasksRegister.ID, tasksRegister, this.jwt()).subscribe(x => {});
  }

  delete(userId: number, id: number) {
    return this.http.delete(this.appConfig.apiUrl + '/user/tasksregister/' + userId + '/' + id, this.jwt()).subscribe(x => {});
  }

  private jwt() {
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if(currentUser && currentUser.token) {
      let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
      return new RequestOptions({headers: headers });
    }
  }
}
