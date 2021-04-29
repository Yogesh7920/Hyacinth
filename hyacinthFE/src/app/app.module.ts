import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NavbarComponent } from './components/navbar/navbar.component';
import { MaterialModule } from './material/material.module';
import { PatientRegistrationComponent } from './components/patient-registration/patient-registration.component';
import { LoginComponent } from './components/login/login.component';
import { AppRoutingModule } from './app-routing.module';
import { FormsModule } from '@angular/forms';
import { AdminHomeComponent } from './components/admin-home/admin-home.component';
import { AdminPatientsComponent } from './components/admin-patients/admin-patients.component';
import { AdminDoctorsComponent } from './components/admin-doctors/admin-doctors.component';
import { HttpClientModule } from '@angular/common/http';
import { AdminNursesComponent } from './components/admin-nurses/admin-nurses.component';
import { DoctorHomeComponent } from './components/doctor-home/doctor-home.component';

@NgModule({
    declarations: [
        AppComponent,
        NavbarComponent,
        PatientRegistrationComponent,
        LoginComponent,
        AdminHomeComponent,
        AdminPatientsComponent,
        AdminDoctorsComponent,
        AdminNursesComponent,
        DoctorHomeComponent
    ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
        MaterialModule,
        AppRoutingModule,
        FormsModule,
        HttpClientModule
    ],
    providers: [],
    bootstrap: [AppComponent]
})
export class AppModule { }
