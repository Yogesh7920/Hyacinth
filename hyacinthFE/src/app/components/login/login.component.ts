import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';


@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss']
})
export class LoginComponent {

    constructor(public dialog: MatDialog) { }

    login = new FormGroup({
        email: new FormControl('', [Validators.required, Validators.email]),
        password: new FormControl('', [Validators.required])
    });

    role = "Patient";

    roles = [
        "Patient",
        "Employee",
    ]

    hide = true;

    get email() {
        return this.login.get('email') as FormControl;
    }

    get password() {
        return this.login.get('password') as FormControl;
    }

}