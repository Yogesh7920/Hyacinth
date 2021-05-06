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


  displayedColumns1: string[] = [];
  colHeads1: string[] = [];
  dataSource1 = new MatTableDataSource([]);

  id;


  getPrescription() {
    let url = `${environment.apiUrl + "prescription"}/${this.id}/`;
    return this.http.get(url);
  }


  ngOnInit(): void {
   

    this.activatedRoute.params.subscribe(params => {
      this.id = params['id']


      this.getPrescription().subscribe(result => {

        let { drugs, diagnostics } = result as any;

        let drug_data = []
        let diagnostics_data = []

        for(const drug of drugs) {
          drug_data.push({
            drugName: drug.name,
            drugCategory: drug.category
          })
        }

        for(const diagnostic of diagnostics) {
          diagnostics_data.push({
            diagnosticsName: diagnostic.name,
            diagnosticsCategory: diagnostic.category
          })
        }


        this.dataSource.data = drug_data;
        this.colHeads = [
          "Drug Name",
          "Drug Category"
        ]
        this.displayedColumns = [
          "drugName",
          "drugCategory"
        ]

        this.dataSource1.data = diagnostics_data;
        this.colHeads1 = [
          "Diagnostics Name",
          "Diagnostics Category"
        ]
        this.displayedColumns1 = [
          "diagnosticsName",
          "diagnosticsCategory"
        ]

      })

    })

  
  }

}
