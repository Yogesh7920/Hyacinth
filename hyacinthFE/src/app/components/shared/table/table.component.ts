import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';

@Component({
    selector: 'app-table',
    templateUrl: './table.component.html',
    styleUrls: ['./table.component.scss']
})
export class TableComponent {

    @Input('data') dataSource;
    @Input('cols') displayedColumns;
    @Input('head') heading;

    onRowClick(event) {
        console.log(event);
    }

}
