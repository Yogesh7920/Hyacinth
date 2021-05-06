import {Component, OnDestroy, OnInit} from '@angular/core';
import {StorageService} from "../../../services/storage.service";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
    selector: 'app-admin-home',
    templateUrl: './admin-home.component.html',
    styleUrls: ['./admin-home.component.scss']
})
export class AdminHomeComponent implements OnInit {

    constructor(private ss: StorageService, private router: Router) { }

    ngOnInit(): void {
        this.ss.navOper('Dashboard');
        this.ss.pushNav({name: 'Dashboard', url: this.router.url});
    }

}
