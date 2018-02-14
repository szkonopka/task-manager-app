import { RouterModule } from '@angular/router';
import { LoginComponent } from '../components/login/login.component';
import { RegisterComponent } from '../components/register/register.component';
import { HomeComponent } from '../components/home/home.component';
import { AuthenticationGuard } from '../guards/authentication.guard';
import { HubComponent } from '../components/hub/hub.component';
import { UserProfileComponent } from '../components/user-profile/user-profile.component';

const appRoutes = [
    { path: 'user', component: HomeComponent, canActivate: [AuthenticationGuard]},
    { path: '', component: HubComponent },
    { path: 'user/profile', component: UserProfileComponent },
    { path: '**', redirectTo: ''}
]

export const routing = RouterModule.forRoot(appRoutes, { enableTracing: true });