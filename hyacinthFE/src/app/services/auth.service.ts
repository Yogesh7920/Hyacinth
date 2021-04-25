import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor() { }

    login(email: string, password: string) {
        localStorage.setItem("email", email);
        localStorage.setItem("password", password);
        // login with backend
    }

    register(patientDetails) {

    }

    logout() {
        localStorage.clear();
    }

}
