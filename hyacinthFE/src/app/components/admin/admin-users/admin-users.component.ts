import { HttpClient } from '@angular/common/http';
import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, NavigationEnd, NavigationStart, Router } from '@angular/router';
import { Subject } from 'rxjs';
import { filter, takeUntil } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { DialogComponent } from '../../dialog/dialog.component';

@Component({
    selector: 'app-admin-users',
    templateUrl: './admin-users.component.html',
    styleUrls: ['./admin-users.component.scss']
})
export class AdminUsersComponent implements OnInit, OnDestroy {

    role: string = "";
    head: string = "";
    links: Array<String> = [];

    constructor(
        private http: HttpClient,
        private route: ActivatedRoute,
        private dialog: MatDialog
    ) { }


    openDialog() {

        const dialogRef = this.dialog.open(DialogComponent, {
            width: '250px',
            data: { role: this.head }
        });
    }

    displayedColumns: string[] = [];
    dataSource = new MatTableDataSource([]);
    private ngUnsubscribe: Subject<any> = new Subject();

    getUsers() {
        let url = environment.apiUrl + this.role;
        return this.http.get(url);
    }

    capitalizeFirstLetter(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
    }

    ngOnInit(): void {
        this.route.params
            .pipe(takeUntil(this.ngUnsubscribe))
            .subscribe(params => {
                this.role = params['role']
                this.head = this.capitalizeFirstLetter(this.role) + "s";
                this.getUsers().subscribe(result => {
                    let { data, key } = result as any;
                    for (const res of data as Array<Object>) {
                        this.links.push(`/${this.role}/dashboard/${res['id']}`);
                    }
                    this.dataSource.data = data as Array<Object>;
                    this.displayedColumns = key;
                    this.displayedColumns.push("Actions");
                });
            });
    }

    ngOnDestroy() {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }
}
