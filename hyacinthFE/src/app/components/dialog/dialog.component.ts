import { Component, OnInit } from '@angular/core';
import {MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material/dialog';
import { Inject } from "@angular/core";

import {
  MAT_DIALOG_DATA
} from "@angular/material/dialog";
import { Form, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss']
})
export class DialogComponent implements OnInit {

  role : string = ""
  employeeForm : FormGroup = null

  constructor(
    public dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }

  close() {
    this.dialogRef.close();
  }


  hide = true;

  employeeDetails = {
    name: new FormControl('', [Validators.required]),
    password: new FormControl('', [Validators.required]),
    phone: new FormControl('', Validators.required),
    email: new FormControl('', [Validators.required, Validators.email]),
    address: new FormControl('', Validators.required),
    sex: new FormControl('', Validators.required),
    salary: new FormControl('', Validators.required),
  }
  


  ngOnInit(): void {
    this.role = this.data["role"]

    if (this.role === "Doctors") {
      this.employeeDetails["bio"] = new FormControl('', Validators.required);
      this.employeeDetails["available"] = new FormControl('', Validators.required);
      this.employeeDetails["specialization"] = new FormControl('', Validators.required);
      this.employeeDetails["qualification"] = new FormControl('', Validators.required);
      this.employeeDetails["license"] = new FormControl('', Validators.required);
    }
    else if (this.role === "Nurses") {
      this.employeeDetails["qualification"] = new FormControl('', Validators.required);
      this.employeeDetails["license"] = new FormControl('', Validators.required);
    }

    else if (this.role === "Drivers") {
      this.employeeDetails["experience"] = new FormControl('', Validators.required);
      this.employeeDetails["licenseNo"] = new FormControl('', Validators.required);
      this.employeeDetails["successRate"] = new FormControl('', Validators.required);
    }
 
  
    this.employeeForm = new FormGroup(this.employeeDetails);
  }

}
