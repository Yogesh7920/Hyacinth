import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminDoctorsComponent } from './components/admin-doctors/admin-doctors.component';
import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { AdminNursesComponent } from './components/admin-nurses/admin-nurses.component';
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
        path: 'admin/doctors',
        component: AdminDoctorsComponent
    },
    {
        path: 'admin/nurses',
        component: AdminNursesComponent
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
