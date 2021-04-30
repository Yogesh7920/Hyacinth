import { group } from '@angular/animations';
import { Component, Input, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

    @Input() isPatient: boolean = true;

    edit = false;

    hide = true;

    validators = {
        validators: [
            (group) => {
                return group.get('password').value === group.get('confPassword').value ? null : { notSame: true }
            }
        ]
    }

    profile = new FormGroup({
        name: new FormControl('', [Validators.required]),
        password: new FormControl('', [Validators.required]),
        phone: new FormControl('', [Validators.required]),
        email: new FormControl('', [Validators.required, Validators.email]),
        address: new FormControl('', [Validators.required]),
        sex: new FormControl('', [Validators.required]),
        medicalHistory: new FormControl(''),
        marital: new FormControl(false),
        confPassword: new FormControl('', [Validators.required])
    }, this.validators);

    ngOnInit(): void {
        this.profile.disable();
    }

    onClear() {
        this.profile.reset({
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

    onEditToggle() {
        this.edit = !this.edit;
        if (this.edit) {
            this.profile.enable();
        } else {
            this.profile.disable();
        }
    }

    onSubmit() {
        console.log(this.profile.value);
    }

}
