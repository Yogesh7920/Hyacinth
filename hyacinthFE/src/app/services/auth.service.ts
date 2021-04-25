import { Injectable } from '@angular/core';
import { StorageService } from './storage.service';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor(private storageService: StorageService) { }

    login({ email, password }) {
        this.storageService.setItem("email", email);
        this.storageService.setItem("password", password);
        this.storageService.setItem("role", "admin");
        this.storageService.setItem("isLoggedIn", "true");
        // login with backend
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
