import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomeLinkPipe, NavbarComponent } from './components/navbar/navbar.component';
import { MaterialModule } from './material/material.module';
import { PatientRegistrationComponent } from './components/patient-registration/patient-registration.component';
import { LoginComponent } from './components/login/login.component';
import { AppRoutingModule } from './app-routing.module';
import { FormsModule } from '@angular/forms';
import { AdminHomeComponent } from './components/admin/admin-home/admin-home.component';
import { HttpClientModule } from '@angular/common/http';
import { TableComponent } from './components/shared/table/table.component';
import { AdminUsersComponent } from './components/admin/admin-users/admin-users.component';
import { ProfileComponent } from './components/profile/profile.component';
import { DriverHomeComponent } from './components/driver-home/driver-home.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { HomeComponent } from './components/home/home.component';
import { DialogComponent } from './components/dialog/dialog.component';

@NgModule({
    declarations: [
        AppComponent,
        NavbarComponent,
        PatientRegistrationComponent,
        LoginComponent,
        AdminHomeComponent,
        TableComponent,
        AdminUsersComponent,
        ProfileComponent,
        DriverHomeComponent,
        DashboardComponent,
        HomeComponent,
        HomeLinkPipe,
        DialogComponent
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
    bootstrap: [AppComponent],

})
export class AppModule { }
