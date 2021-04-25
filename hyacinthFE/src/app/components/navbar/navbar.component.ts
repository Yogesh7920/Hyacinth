import { Component, Input, OnInit } from '@angular/core';
import { StorageService } from 'src/app/services/storage.service';

@Component({
    selector: 'app-navbar',
    templateUrl: './navbar.component.html',
    styleUrls: ['./navbar.component.scss'],
})
export class NavbarComponent implements OnInit {
    @Input() snav;

    isLoggedIn = !!localStorage.getItem("isLoggedIn");
    constructor(private storageService: StorageService) { }

    ngOnInit() {
        this.storageService.watchStorage().subscribe(event => {
            console.log(event);
            if (!event) {
                this.isLoggedIn = false;
            } else {
                if (event == "isLoggedIn") {
                    this.isLoggedIn = !!this.storageService.getItem("isLoggedIn");
                }
            }
        })
    }

    logout() {
        this.storageService.clear();
    }
}
