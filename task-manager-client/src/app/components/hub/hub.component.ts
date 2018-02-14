import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-hub',
  templateUrl: './hub.component.html',
  styleUrls: ['./hub.component.sass']
})
export class HubComponent implements OnInit {
  loginPanel = true;
  registerPanel = false;
  constructor() { }

  ngOnInit() {
  }

  changeAuthComponent() {
    this.loginPanel = !this.loginPanel;
    this.registerPanel = !this.registerPanel;
  }
}
