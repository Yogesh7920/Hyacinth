from fastapi import APIRouter
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


@router.post('/registration')
def employee_registration(email, password):
    res = cur.callproc('EmployeeRegistration', (email, password, True))
    result = cur.fetchone()

    return {'role': result}
