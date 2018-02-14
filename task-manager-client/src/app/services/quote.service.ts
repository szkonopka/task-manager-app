import { Injectable } from '@angular/core';
import { Http, RequestOptions, Response, Headers } from '@angular/http';
import { AppConfig } from '../config/app.config';

@Injectable()
export class QuoteService {

  constructor(private http: Http, private appConfig: AppConfig) { }

  getByID() {

  }

  getRandom() {
    return this.http.get(this.appConfig.apiUrl + '/quote/random').map((response: Response) => response.json());
  }

  private jwt() {
    let currentUser = JSON.parse(localStorage.getItem('curretUser'));
    if(currentUser && currentUser.token) {
      let headers = new Headers({ 'Authorization': 'Bearer' + currentUser.token });
      return new RequestOptions({ headers: headers });
    }
  }

}
