import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import {ActivatedRoute, Router} from "@angular/router";
import { MatTableDataSource } from "@angular/material/table";
import { combineLatest, forkJoin, Subject } from "rxjs";
import { environment } from "../../../environments/environment";
import { takeUntil } from "rxjs/operators";
import { RoleService } from 'src/app/services/role.service';
import {StorageService} from "../../services/storage.service";

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
        private roleService: RoleService,
        private ss: StorageService,
        private router: Router
    ) { }

    displayedColumns: string[] = [];
    colHeads: string[] = [];
    dataSource = new MatTableDataSource([]);
    links = [];
    private ngUnsubscribe: Subject<any> = new Subject();

    getProfile() {
        let url = `${environment.apiUrl + this.role}/${this.id}`;
        return this.http.get(url);
    }

    getDashboard() {
        let url = `${environment.apiUrl + this.role}/dashboard/${this.id}/`;
        return this.http.get(url);
    }

    capitalizeFirstLetter(str) {
        return str.charAt(0).toUpperCase() + str.slice(1);
    }

    ngOnInit(): void {

        this.activatedRoute.params.subscribe(params => {
            this.id = params['id'];
            this.role = params['role'];
            this.ss.navOper(this.role + '-Dashboard');
            this.ss.pushNav({name: this.role + '-Dashboard', url: this.router.url});
            this.roleService.setData({
                role: this.role,
                id: this.id
            });
            forkJoin([
                this.getDashboard(),
                this.getProfile()
            ]).subscribe(result => {
                let { data, key } = result[0] as any;
                this.dataSource.data = data;
                for (const row of data) {
                    let url = ""
                    if (this.role == "patient") {
                        url = `/consultation/${row['id']}`;
                        this.colHeads = [
                            'Consultation ID',
                            'Problem',
                            'Doctor ID',
                            'Patient ID',
                            'Specialization'
                        ];
                        this.displayedColumns = [
                            'id',
                            'problem',
                            'doctorID',
                            'patientID',
                            'specialization'
                        ]
                        this.links.push(url);
                    } else if (this.role == "doctor") {
                        url = `/consultation/${row['id']}`;
                        this.colHeads = [
                            'Consultation ID',
                            'Patient ID',
                            'Patient',
                            'Problem',
                        ];
                        this.displayedColumns = [
                            "id",
                            "patientID",
                            "name",
                            "problem",
                        ]
                        this.links.push(url);
                    } else if (this.role == "nurse") {
                        url = `/diagnostics/${row['id']}`;
                        this.colHeads = [
                            "Diagnostics ID",
                            "Diagnostics Name",
                            "Category"
                        ];
                        this.displayedColumns = [
                            "id",
                            "diagnostics",
                            "category"
                        ];
                        // this.links.push(url);
                    } else if (this.role == "driver") {
                        url = `/diagnostics/${row['id']}`;
                        this.colHeads = [
                            "Journey ID",
                            "Address",
                            "Start Time",
                            "End Time",
                            "Total Distance"
                        ];
                        this.displayedColumns = [
                            "id",
                            "address",
                            "startTime",
                            "endTime",
                            "totalDistance"
                        ];
                        // this.links.push(url);
                    } else if (this.role == "vendor") {
                        console.log(data);
                        this.colHeads = [
                            "Drug ID",
                            "Drug Name",
                            "Price",
                            "Order Time",
                            "Supply Time",
                        ];
                        this.displayedColumns = [
                            "id",
                            "drugName",
                            "price",
                            "orderTime",
                            "supplyTime"
                        ];
                    }
                }
                this.head = result[1]['name'];
            })
            this.head = this.capitalizeFirstLetter(this.role) + "s";
        });
    }

    ngOnDestroy() {
        this.ngUnsubscribe.next();
        this.ngUnsubscribe.complete();
    }

}
