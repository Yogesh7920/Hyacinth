import { group } from '@angular/animations';
import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {

    @Input() isPatient: boolean = true;

    constructor(
        private activatedRoute: ActivatedRoute,
        private http: HttpClient
    ) { }

    edit = false;
    role: string = "";
    id: string = "";
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
        phone: new FormControl('', [Validators.required]),
        email: new FormControl('', [Validators.required, Validators.email]),
        address: new FormControl('', [Validators.required]),
        sex: new FormControl('', [Validators.required]),
        medicalHistory: new FormControl(''),
        marital: new FormControl(false),
        password: new FormControl(''),
        confPassword: new FormControl('')
    }, this.validators);

    getProfile() {
        let url = `${environment.apiUrl + this.role}/${this.id}`;
        return this.http.get(url);
    }

    ngOnInit(): void {
        this.profile.disable();
        this.activatedRoute.params.subscribe(params => {
            this.role = params['role'];
            this.id = params['id'];
            this.getProfile().subscribe((result: any) => {
                let { name, email, phone, address, sex,
                    medicalHistory = "", marital = false,
                    password = "", confPassword = "" } = result;
                this.profile.setValue({
                    name,
                    email,
                    phone,
                    address,
                    sex,
                    medicalHistory,
                    marital,
                    password,
                    confPassword
                })
                // this.profile.setValue(result)
            })
        });
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
