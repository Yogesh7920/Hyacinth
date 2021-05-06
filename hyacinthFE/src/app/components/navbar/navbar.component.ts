import { Component, Input, OnInit, Pipe, PipeTransform } from '@angular/core';
import { Router } from '@angular/router';
import { RoleService } from 'src/app/services/role.service';
import { StorageService } from 'src/app/services/storage.service';

@Pipe({ name: 'homeLink' })
export class HomeLinkPipe implements PipeTransform {
    transform(role: string, id: string): string {
        if (!role) {
            return "";
        }
        return `/${role}/dashboard/${id}`;
    }
}

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

    constructor(private storageService: StorageService,
        private router: Router) { }

    ngOnInit() {

        this.storageService.watchStorage().subscribe(event => {
            if (!event) {
                this.isLoggedIn = false;
                this.role = null;
                this.id = null;
            } else {
                if (event == "isLoggedIn") {
                    this.isLoggedIn = !!this.storageService.getItem("isLoggedIn");
                }
                if (event == "role") {
                    this.role = localStorage.getItem("role");
                }
                if (event == "id") {
                    this.id = localStorage.getItem("id");
                }
            }
        })
    }

    getHomeLink() {
        if (!this.role) {
            return "";
        }
        return `/${this.role}/dashboard/${this.id}`;
    }

    logout() {
        this.storageService.clear();
        this.router.navigate([""]);
    }
}
