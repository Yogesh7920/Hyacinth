import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

    constructor(private router: Router) { }

    ngOnInit() {
        if (!!localStorage.getItem("isLoggedIn")) {
            this.router.navigate([localStorage.getItem("role"), "dashboard", localStorage.getItem("id")]);
        }
    }

    fillerNav = Array.from({ length: 50 }, (_, i) => `Nav Item ${i + 1}`);

    fillerContent = Array.from(
        { length: 50 },
        () =>
            `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
       labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
       laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
       voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
       cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`
    );
}
