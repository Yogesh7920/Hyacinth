import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-patient-registration',
  templateUrl: './patient-registration.component.html',
  styleUrls: ['./patient-registration.component.scss']
})
export class PatientRegistrationComponent {
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
    }, {validators: (group) => group.get('password').value === group.get('confPassword').value ? null : {notSame: true}});

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
        console.log(this.registrationForm.value);
    }
}
