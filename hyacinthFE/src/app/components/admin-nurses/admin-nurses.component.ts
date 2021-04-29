import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-admin-nurses',
    templateUrl: './admin-nurses.component.html',
    styleUrls: ['./admin-nurses.component.scss']
})
export class AdminNursesComponent implements OnInit {

    constructor(
        private http: HttpClient
    ) { }

    displayedColumns: string[] = ['ID', 'email', 'name', 'phone', 'sex'];
    dataSource = new MatTableDataSource([]);

    getDoctors() {
        let url = environment.apiUrl + "nurse";
        return this.http.get(url);
    }

    ngOnInit(): void {
        this.getDoctors().subscribe(result => {
            this.dataSource.data = result as Array<Object>;
        })
    }
}
