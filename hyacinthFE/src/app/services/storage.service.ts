import { Injectable } from "@angular/core";
import {BehaviorSubject, Observable, Subject} from "rxjs";

@Injectable({
    providedIn: "root"
})
export class StorageService {
    private storageSub = new Subject<String>();
    
    nav = new BehaviorSubject<any>([]);

    pushNav(obj: {'name': string, 'url': string}) {
        const arr = this.nav.getValue()
        arr.push(obj);
        this.nav.next(arr);
    }

    popNav() {
        const arr = this.nav.getValue().pop()
        this.nav.next(arr);
    }
    
    navOper(name) {
        const arr = this.nav.getValue();
        const ind = arr.findIndex(obj => obj.name == name);
        if (ind != -1) {
            arr.splice(ind, arr.length-ind);
        }
    }
    
    watchStorage(): Observable<any> {
        return this.storageSub.asObservable();
    }

    setItem(key: string, data: any) {
        localStorage.setItem(key, data);
        this.storageSub.next(key);
    }

    getItem(key: string) {
        return localStorage.getItem(key);
    }

    clear() {
        localStorage.clear();
        this.storageSub.next(null);
    }

    removeItem(key) {
        localStorage.removeItem(key);
        this.storageSub.next(key);
    }
}