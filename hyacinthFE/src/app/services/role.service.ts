import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class RoleService {

    constructor() { }

    data = { role: "", id: "" };

    private roleSub = new Subject<Object>();

    setData(data) {
        this.roleSub.next(data);
    }

    watchRole(): Observable<any> {
        return this.roleSub.asObservable();
    }

}
