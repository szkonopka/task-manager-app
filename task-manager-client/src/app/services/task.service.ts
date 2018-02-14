import { Injectable } from '@angular/core';
import { Http, RequestOptions, Headers, Response, RequestMethod } from '@angular/http';
import { AppConfig } from '../config/app.config';
import { Task } from '../models/task';
import { Observable } from 'rxjs/Observable';

import 'rxjs/add/operator/map';

@Injectable()
export class TaskService {

  constructor(private http: Http, private appConfig: AppConfig) { }

  getAll(userId: number): Observable<Task[]>{
    return this.http.get(this.appConfig.apiUrl + '/user/tasks/' + userId, this.jwt()).map((response: Response) => response.json() as Task[]);
  }

  getByID(userId: number, id: number) {
    return this.http.get(this.appConfig.apiUrl + '/user/tasks/' + userId + '/' + id, this.jwt()).map((response: Response) => response.json());
  }

  create(task: Task) {
    return this.http.post(this.appConfig.apiUrl + '/user/tasks/create', task, this.jwt());
  }

  update(task: Task) {
    return this.http.put(this.appConfig.apiUrl + '/user/tasks/' + task.UserID + '/' + task.ID, task, this.jwt());
  }

  delete(userId: number, id: number) {
    return this.http.delete(this.appConfig.apiUrl + '/user/tasks/' + userId + '/' + id, this.jwt());
  }

  private jwt() {
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if(currentUser && currentUser.token) {
      let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
      return new RequestOptions({headers: headers });
    }
  }
}
