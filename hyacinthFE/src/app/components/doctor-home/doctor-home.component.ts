import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-doctor-home',
    templateUrl: './doctor-home.component.html',
    styleUrls: ['./doctor-home.component.scss']
})
export class DoctorHomeComponent implements OnInit {

    constructor(
        private http: HttpClient
    ) { }
    

    role : string = ""
    id : number = 0

    displayedColumns: string[] = [];
    dataSource = new MatTableDataSource([]);

    ngOnInit(): void {

        this.role = localStorage.getItem("role")

        this.id = +localStorage.getItem("id")
        
        const url = environment.apiUrl + this.role + "/records/" + this.id
        
        this.http.get(url)
        .subscribe(data => {

            this.displayedColumns = Object.keys(data[0])
            this.dataSource.data = data as Array<Object> 
            console.log(data)
        })

    }

}