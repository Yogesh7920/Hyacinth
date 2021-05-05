import { Component, OnInit } from '@angular/core';
import {MatDialog, MatDialogConfig, MatDialogRef } from '@angular/material/dialog';
import { Inject } from "@angular/core";

import {
  MAT_DIALOG_DATA
} from "@angular/material/dialog";
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrls: ['./dialog.component.scss']
})
export class DialogComponent implements OnInit {

  role : string = ""

  constructor(
    public dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }

  close() {
    this.dialogRef.close();
  }

  doctorForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required])
  });


  ngOnInit(): void {
    this.role = this.data["role"]
    console.log(this.data)
  }

}
