import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { StorageService } from './storage.service';

@Injectable({
    providedIn: 'root'
})
export class AuthService {

    constructor(
        private http: HttpClient
    ) { }

    login({ email, password }, role: string) {
        role = role.toLowerCase();
        let url = `${environment.apiUrl}${role}/login/`;
        return this.http.post(url, {
            email,
            password
        });
    }

    register(patientDetails) {
        let url = `${environment.apiUrl}patient/registration/`;
        return this.http.post(url, patientDetails);
    }

    logout() {
        localStorage.clear();
    }

}
