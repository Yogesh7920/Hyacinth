import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { AdminUsersComponent } from './components/admin-users/admin-users.component';
import { PatientRegistrationComponent } from './components/patient-registration/patient-registration.component';
import { ProfileComponent } from './components/profile/profile.component';
import {PatientHomeComponent} from './components/patient-home/patient-home.component';

const routes: Routes = [
    {
        path: 'login',
        component: ProfileComponent
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
    },
    {
        path: 'patient/home/:id',
        component: PatientHomeComponent
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
