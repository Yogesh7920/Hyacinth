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
import { HttpClientModule } from '@angular/common/http';
import { DoctorHomeComponent } from './components/doctor-home/doctor-home.component';
import { TableComponent } from './components/shared/table/table.component';
import { AdminUsersComponent } from './components/admin-users/admin-users.component';
import { ProfileComponent } from './components/profile/profile.component';
import { PatientHomeComponent } from './components/patient-home/patient-home.component';
import { DriverHomeComponent } from './components/driver-home/driver-home.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';

@NgModule({
    declarations: [
        AppComponent,
        NavbarComponent,
        PatientRegistrationComponent,
        LoginComponent,
        AdminHomeComponent,
        DoctorHomeComponent,
        TableComponent,
        AdminUsersComponent,
        ProfileComponent,
        PatientHomeComponent,
        DriverHomeComponent
        DashboardComponent
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
