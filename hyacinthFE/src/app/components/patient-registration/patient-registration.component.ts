import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { StorageService } from 'src/app/services/storage.service';

@Component({
    selector: 'app-patient-registration',
    templateUrl: './patient-registration.component.html',
    styleUrls: ['./patient-registration.component.scss']
})
export class PatientRegistrationComponent {

    constructor(
        private authService: AuthService,
        private storageService: StorageService,
        private snackBar: MatSnackBar,
        private router: Router
    ) { }

    hide = true;
    registrationForm = new FormGroup({
        name: new FormControl('', [Validators.required]),
        password: new FormControl('', [Validators.required]),
        phone: new FormControl('', [Validators.required]),
        email: new FormControl('', [Validators.required, Validators.email]),
        address: new FormControl('', [Validators.required]),
        sex: new FormControl('', [Validators.required]),
        medicalHistory: new FormControl(''),
        marital: new FormControl(false, [Validators.required]),
        confPassword: new FormControl('', [Validators.required])
    }, { validators: (group) => group.get('password').value === group.get('confPassword').value ? null : { notSame: true } });

    onClear() {
        this.registrationForm.reset({
            name: '',
            password: '',
            phone: '',
            email: '',
            address: '',
            sex: '',
            medicalHistory: '',
            marital: false
        });
    }

    onSubmit() {
        let phone = this.registrationForm.get('phone').value;
        let result = {
            ...this.registrationForm.value,
            phone: `+91 ${phone}`
        };
        this.authService.register(result).subscribe(result => {
            if (result['id'] == -1) {
                let sbref = this.snackBar.open("User already exists with this email-id, Please login.", "Ok");
                sbref.afterDismissed().subscribe(() => {
                    this.router.navigate(["login"]);
                })
            }
            this.storageService.setItem("isLoggedIn", "true");
            this.storageService.setItem("role", "patient");
            this.storageService.setItem("id", result['id']);
            this.router.navigate(["patient", "dashboard", result['id']]);
        })
    }
}
