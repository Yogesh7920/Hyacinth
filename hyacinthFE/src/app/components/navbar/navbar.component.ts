import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { StorageService } from 'src/app/services/storage.service';

@Component({
    selector: 'app-navbar',
    templateUrl: './navbar.component.html',
    styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
    @Input() snav;

    isLoggedIn = !!localStorage.getItem("isLoggedIn");
    role = localStorage.getItem("role");
    constructor(private storageService: StorageService, private router: Router) { }

    ngOnInit() {
        this.storageService.watchStorage().subscribe(event => {
            if (!event) {
                this.isLoggedIn = false;
            } else {
                if (event == "isLoggedIn") {
                    this.isLoggedIn = !!this.storageService.getItem("isLoggedIn");
                }
            }
        })
    }

    getHomeLink() {
        if (!this.role) {
            return "login";
        }
        return this.role;
    }

    logout() {
        this.storageService.clear();
        this.router.navigate(["login"]);
    }
}
