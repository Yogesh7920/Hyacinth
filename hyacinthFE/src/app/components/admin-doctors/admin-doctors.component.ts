import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';

@Component({
    selector: 'app-admin-doctors',
    templateUrl: './admin-doctors.component.html',
    styleUrls: ['./admin-doctors.component.scss']
})
export class AdminDoctorsComponent implements OnInit {

    constructor(
        private http: HttpClient
    ) { }

    displayedColumns: string[] = ['ID', 'email', 'name', 'phone', 'sex'];
    dataSource = new MatTableDataSource([]);

    getDoctors() {
        let url = "http://127.0.0.1:8000/doctors";
        return this.http.get(url);
    }

    ngOnInit(): void {
        this.getDoctors().subscribe(result => {
            this.dataSource.data = result as Array<Object>;
        })
    }

}
