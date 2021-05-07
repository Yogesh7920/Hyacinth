from typing import Optional

from fastapi import APIRouter
from pydantic import BaseModel

from database import Global

router = APIRouter(
    prefix="/employee",
    tags=["employee"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


class Employee(BaseModel):
    ID: Optional[int]
    name: str
    password: str
    phone: str
    email: str
    address: str
    sex: str
    salary: str


@router.get('/')
def get_employees():
    res = []
    cur.execute("select employeeID, name from Employee")
    for ID, name in cur:
        res.append({
            'id': ID,
            'name': name
        })
    return res


class Login(BaseModel):
    email: str
    password: str


@router.post('/login/')
def employee_login(data: Login):
    email = data.email
    password = data.password
    cur.callproc('EmployeeLogin', (email, password, "", -1))
    result = cur.fetchall()
    cur.nextset()
    role, pk = result[0]
    return {'role': role, 'id': pk}


@router.delete('/{pk}')
def del_employee(pk):
    cur.callproc('delEmployee', (pk,))
    return True
