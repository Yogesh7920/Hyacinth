import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { StorageService } from './storage.service';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor(
        private storageService: StorageService,
        private http: HttpClient
    ) { }

    login({ email, password }, role: string) {
        this.storageService.setItem("email", email);
        this.storageService.setItem("password", password);
        this.storageService.setItem("isLoggedIn", "true");
        role = role.toLowerCase();
        let url = `${environment.apiUrl}${role}/login`;
        this.http.post(url, {
            email,
            password
        }).subscribe(result => {
            console.log(result);
        })
    }

    register(patientDetails) {
        this.storageService.setItem("email", patientDetails['email']);
        this.storageService.setItem("password", patientDetails['password']);
        this.storageService.setItem("isLoggedIn", "true");
    }

    logout() {
        localStorage.clear();
    }

}
