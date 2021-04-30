import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { AdminUsersComponent } from './components/admin-users/admin-users.component';
import { LoginComponent } from './components/login/login.component';
import { PatientRegistrationComponent } from './components/patient-registration/patient-registration.component';

const routes: Routes = [
    {
        path: 'login',
        component: LoginComponent
    },
    {
        path: 'register/patient',
        component: PatientRegistrationComponent
    },
    {
        path: 'admin',
        component: AdminHomeComponent
    },
    {
        path: 'admin/doctor',
        component: AdminUsersComponent
    },
    {
        path: 'admin/nurse',
        component: AdminUsersComponent
    },
    {
        path: 'admin/patient',
        component: AdminUsersComponent
    },
    {
        path: 'admin/driver',
        component: AdminUsersComponent
    }
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
