import { HttpClient } from '@angular/common/http';
import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, NavigationEnd, NavigationStart, Router } from '@angular/router';
import { Subject } from 'rxjs';
import { filter, takeUntil } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { DialogComponent } from '../../dialog/dialog.component';
import {StorageService} from "../../../services/storage.service";

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
        private dialog: MatDialog,
        private ss: StorageService,
        private router: Router
    ) { }

    addUser(data) {
        const url = `${environment.apiUrl + this.role}/add`
        return this.http.post(url, data)
    }

    openDialog() {

        const dialogRef = this.dialog.open(DialogComponent, {
            width: '700px',
            height: '800px',
            data: { role: this.head }
        });

        dialogRef.afterClosed().subscribe((result) => {

            if (result["msg"] == "submit") {
                console.log(result);
                this.addUser(result["formData"]).subscribe(data => {
                    this.ngOnInit()
                })
            }
            else {
                dialogRef.close()
            }
        })
    }

    displayedColumns: string[] = [];
    dataSource = new MatTableDataSource([]);
    colHeads = [];
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
                
                this.ss.navOper(this.role);
                this.ss.pushNav({name: this.role, url: this.router.url});
                
                this.head = this.capitalizeFirstLetter(this.role) + "s";
                this.getUsers().subscribe(result => {
                    let { data, key } = result as any;
                    for (const res of data as Array<Object>) {
                        this.links.push(`/${this.role}/dashboard/${res['id']}`);
                    }
                    this.dataSource.data = data as Array<Object>;
                    if (this.role == "vendor") {
                        this.colHeads = [
                            "Vendor ID",
                            "Vendor",
                            "Phone",
                            "Email",
                            "Address"
                        ];
                        this.displayedColumns = [
                            "id",
                            "name",
                            "phone",
                            "email",
                            "address"
                        ];
                    } else {
                        this.colHeads = [
                            "Employee ID",
                            "Name",
                            "Phone",
                            "Email",
                            "Sex",
                            "Actions"
                        ];
                        this.displayedColumns = [
                            "id",
                            "name",
                            "phone",
                            "email",
                            "sex",
                            "Actions"
                        ]
                    }
                });
            });
    }

    ngOnDestroy() {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }
}
