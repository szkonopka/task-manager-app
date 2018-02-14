import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { HomeComponent } from './components/home/home.component';
import { routing } from './config/app.routing';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { AppConfig } from './config/app.config';
import { AuthenticationGuard } from './guards/authentication.guard';
import { AuthenticationService } from './services/authentication.service';
import { UserService } from './services/user.service';
import { AlertComponent } from './components/alert/alert.component';
import { AlertService } from './services/alert.service';
import { HubComponent } from './components/hub/hub.component'
import { TaskService } from './services/task.service';
import { HomeTasksComponent } from './components/home/home-tasks/home-tasks.component';
import { UserDataService } from './services/app/user-data.service';
import { QuoteComponent } from './components/home/quote/quote.component';
import { QuoteService } from './services/quote.service';
import { TaskEditorComponent } from './components/home/task-editor/task-editor.component';
import { TasksRegisterEditorComponent } from './components/home/tasks-register-editor/tasks-register-editor.component';
import { ActiveTasksPipe } from './pipes/active-tasks.pipe';
import { TasksRegisterService } from './services/tasks-register.service';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { RegistersListComponent } from './components/home/registers-list/registers-list.component';

@NgModule({
  declarations: [
    AppComponent,
    AlertComponent,
    LoginComponent,
    RegisterComponent,
    HomeComponent,
    HubComponent,
    HomeTasksComponent,
    QuoteComponent,
    TaskEditorComponent,
    TasksRegisterEditorComponent,
    ActiveTasksPipe,
    UserProfileComponent,
    RegistersListComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [
    AppConfig,
    AuthenticationGuard,
    AlertService,
    AuthenticationService,
    UserService,
    TaskService,
    UserDataService,
    QuoteService,
    TaskEditorComponent,
    TasksRegisterService,
    HomeTasksComponent,
    RegistersListComponent,
    HomeComponent
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
