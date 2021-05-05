import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RoleService } from 'src/app/services/role.service';
import { StorageService } from 'src/app/services/storage.service';

@Component({
    selector: 'app-navbar',
    templateUrl: './navbar.component.html',
    styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
    @Input() snav;

    isLoggedIn = !!localStorage.getItem("isLoggedIn");
    role: string = localStorage.getItem("role");
    id: string = localStorage.getItem("id");
    // profileRole: string = this.role;
    // profileId: string = "";
    constructor(private storageService: StorageService,
        private router: Router,
        private roleService: RoleService) { }

    ngOnInit() {

        console.log(this.role, this.id);

        this.storageService.watchStorage().subscribe(event => {
            if (!event) {
                this.isLoggedIn = false;
            } else {
                if (event == "isLoggedIn") {
                    this.isLoggedIn = !!this.storageService.getItem("isLoggedIn");
                    this.role = localStorage.getItem("role");
                    this.id = localStorage.getItem("id");
                }
            }
        })
    }

    getHomeLink() {
        if (!this.role) {
            return "login";
        }
        return `/${this.role}/dashboard/${this.id}`;
    }

    logout() {
        this.storageService.clear();
        this.router.navigate(["login"]);
    }
}
