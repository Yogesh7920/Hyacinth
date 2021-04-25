import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';


@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss']
})
export class LoginComponent {

    constructor(
        public dialog: MatDialog,
        private authService: AuthService,
        private router: Router
    ) { }

    loginForm = new FormGroup({
        email: new FormControl('', [Validators.required, Validators.email]),
        password: new FormControl('', [Validators.required])
    });

    role = "Patient";

    roles = [
        "Patient",
        "Employee",
    ]

    hide = true;

    onSubmit() {
        this.authService.login(this.loginForm.value);
        this.router.navigate([localStorage.getItem("role")]);
    }

}