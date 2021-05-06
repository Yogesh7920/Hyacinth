import { HttpClient } from '@angular/common/http';
import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { environment } from 'src/environments/environment';

@Component({
    selector: 'app-table',
    templateUrl: './table.component.html',
    styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {

    @Input('data') dataSource;
    @Input('cols') displayedColumns;
    @Input('head') heading;
    @Input('colhead') colHeads;
    @Input() links;
    curRoute: string = "";

    constructor(
        private route: ActivatedRoute,
        private http: HttpClient
    ) { }

    role: string = "";

    ngOnInit() {
        this.route.url.subscribe(route => {
            this.curRoute = "/";
            for (const path of route) {
                this.curRoute += path.path + "/";
            }
        })
        this.route.params.subscribe(params => {
            this.role = params['role'];
        })
    }

    onRowClick(event) {
        console.log(event);
    }

    removeUser(event, user) {
        event.stopPropagation();
        let url = `${environment.apiUrl + this.role}/${user['id']}`;
        this.http.delete(url).subscribe(result => {
            console.log(result);
        });
    }

    getProfileLink(user) {
        return `/${this.role}/${user['id']}`;
    }

}
