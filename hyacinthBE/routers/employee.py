from fastapi import APIRouter
from pydantic import BaseModel

from database import Global

router = APIRouter(
    prefix="/employee",
    tags=["employee"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


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
def employee_registration(data: Login):
    email = data.email
    password = data.password
    res = cur.callproc('EmployeeRegistration', (email, password, "", -1))
    result = cur.fetchall()[0]
    print(result)
    role, pk = result
    return {'role': role, 'id': pk}
