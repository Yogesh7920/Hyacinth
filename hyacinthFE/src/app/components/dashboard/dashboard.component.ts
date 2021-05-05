import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { ActivatedRoute } from "@angular/router";
import { MatTableDataSource } from "@angular/material/table";
import { combineLatest, forkJoin, Subject } from "rxjs";
import { environment } from "../../../environments/environment";
import { takeUntil } from "rxjs/operators";
import { RoleService } from 'src/app/services/role.service';

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
        private activatedRoute: ActivatedRoute,
        private roleService: RoleService
    ) { }

    displayedColumns: string[] = [];
    dataSource = new MatTableDataSource([]);
    private ngUnsubscribe: Subject<any> = new Subject();

    getUsers() {
        let url = `${environment.apiUrl + this.role}/dashboard/${this.id}`;
        return this.http.get(url);
    }

    capitalizeFirstLetter(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
    }

    ngOnInit(): void {

        this.activatedRoute.params.subscribe(params => {
            this.id = params['id'];
            this.role = params['role'];
            this.roleService.setData({
                role: this.role,
                id: this.id
            });
            this.head = this.capitalizeFirstLetter(this.role) + "s";
            this.getUsers().subscribe(result => {
                console.log(result)
                this.dataSource.data = result as Array<Object>;
                // @ts-ignore
                if (result.length) {
                    this.displayedColumns = Object.keys(result[0]);
                }

            });
        });
    }

    ngOnDestroy() {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

}
