import { Component, OnInit } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {ActivatedRoute} from "@angular/router";
import {MatTableDataSource} from "@angular/material/table";
import {Subject} from "rxjs";
import {environment} from "../../../environments/environment";
import {takeUntil} from "rxjs/operators";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

    role: string = "";
    head: string = "";
    id;

    constructor(
        private http: HttpClient,
        private activatedRoute: ActivatedRoute
    ) { }

    displayedColumns: string[] = [];
    dataSource = new MatTableDataSource([]);
    private ngUnsubscribe: Subject<any> = new Subject();

    getUsers() {
        let url = environment.apiUrl + this.role + '/dashboard' + '/' + this.id;
        return this.http.get(url);
    }

    capitalizeFirstLetter(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
    }

    ngOnInit(): void {
        this.activatedRoute.url
            .pipe(takeUntil(this.ngUnsubscribe))
            .subscribe(route => {
                this.id = route[2].path;
                this.role = route[0].path;
                this.head = this.capitalizeFirstLetter(this.role) + "s";
                this.getUsers().subscribe(result => {
                    this.dataSource.data = result as Array<Object>;
                    this.displayedColumns = Object.keys(result[0]);
                });
            });
    }

    ngOnDestroy() {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

}
