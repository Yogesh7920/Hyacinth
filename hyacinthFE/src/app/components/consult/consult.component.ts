import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-consult',
  templateUrl: './consult.component.html',
  styleUrls: ['./consult.component.scss']
})
export class ConsultComponent implements OnInit {


  displayedColumns: string[] = [];
  colHeads: string[] = [];
  dataSource = new MatTableDataSource([]);
  id;

  constructor(
    private http: HttpClient,
    private activatedRoute: ActivatedRoute,
  ) { }

  getAppointment() {

    let url = `${environment.apiUrl + "consultation"}/${this.id}/`;
    return this.http.get(url);

  }

  ngOnInit(): void {

    this.activatedRoute.params.subscribe(params => {
      this.id = params['id']


      this.getAppointment().subscribe(result => {

        console.log(result)
        let { data, key } = result as any;
        console.log(data)
        this.dataSource.data = data;
        this.colHeads = [
          "ID",
          "Start Time",
          "End Time",
          "Remarks",
          "Invoice ID",
          "Prescription ID"
        ]
        this.displayedColumns = [
          "id",
          "startTime",
          "endTime",
          "remarks",
          "invoiceID",
          "presID"
        ]

      })

    })

  }

}