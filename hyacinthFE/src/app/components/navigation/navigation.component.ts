import { Component, OnInit } from '@angular/core';
import {StorageService} from "../../services/storage.service";

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.scss']
})
export class NavigationComponent implements OnInit {
    
    arr: Array<any>;
    constructor(private ss: StorageService) { }
    
    ngOnInit(): void {
        this.ss.nav.subscribe(r => {
            this.arr = r
        });
    }

}
