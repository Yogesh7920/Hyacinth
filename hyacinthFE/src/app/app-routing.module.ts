import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './components/admin/admin-home/admin-home.component';
import { AdminUsersComponent } from './components/admin/admin-users/admin-users.component';
import { PatientRegistrationComponent } from './components/patient-registration/patient-registration.component';
import { DashboardComponent } from "./components/dashboard/dashboard.component";
import { LoginComponent } from './components/login/login.component';
import { DoctorHomeComponent } from './components/doctor-home/doctor-home.component';

const routes: Routes = [
    {path: 'login', component: LoginComponent },
    {path: 'admin', component: AdminHomeComponent},
    {path: 'admin/:role', component: AdminUsersComponent},
    {path: 'register/patient', component: PatientRegistrationComponent},
    {path: 'patient/:id', component: DashboardComponent},
    {path: 'doctor/:id',component: DashboardComponent},
    {path: 'nurse/:id',component: DashboardComponent},
    {path: 'driver/:id',component: DashboardComponent},
];


@NgModule({
    imports: [
        RouterModule.forRoot(routes)
    ],
    exports: [
        RouterModule
    ]
})
export class AppRoutingModule { }
