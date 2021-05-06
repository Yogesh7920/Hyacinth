import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-prescription',
  templateUrl: './prescription.component.html',
  styleUrls: ['./prescription.component.scss']
})
export class PrescriptionComponent implements OnInit {

  constructor(
    private http: HttpClient,
    private activatedRoute: ActivatedRoute,
  ) { }
  
  displayedColumns: string[] = [];
  colHeads: string[] = [];
  dataSource = new MatTableDataSource([]);
  id;


  getPrescription() {
    let url = `${environment.apiUrl + "prescription"}/${this.id}/`;
    return this.http.get(url);
  }


  ngOnInit(): void {
   

    this.activatedRoute.params.subscribe(params => {
      this.id = params['id']


      this.getPrescription().subscribe(result => {

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
