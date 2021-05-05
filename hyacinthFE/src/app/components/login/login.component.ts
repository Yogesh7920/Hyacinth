import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { StorageService } from 'src/app/services/storage.service';


@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss']
})
export class LoginComponent {

    constructor(
        public dialog: MatDialog,
        private authService: AuthService,
        private storageService: StorageService,
        private router: Router,
        private _snackBar: MatSnackBar
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
        this.authService.login(this.loginForm.value, this.role).subscribe(result => {
            if (result['id'] !== -1) {
                this.storageService.setItem("email", this.loginForm.get('email').value);
                this.storageService.setItem("password", this.loginForm.get('password').value);
                this.storageService.setItem("isLoggedIn", "true");
                this.storageService.setItem("role", result['role'].toLowerCase());
                this.storageService.setItem("id", result['id']);
                let url = `/${result['role'].toLowerCase()}/dashboard/${result['id']}`;
                this.router.navigate([url]);
            } else {
                this._snackBar.open("Are you registered? Check your email-id and password", "Ok");
            }
        })
        // this.router.navigate([localStorage.getItem("role")]);
    }

}