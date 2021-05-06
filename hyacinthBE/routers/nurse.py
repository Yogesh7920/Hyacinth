from fastapi import APIRouter
from routers.employee import Employee

from database import Global

router = APIRouter(
    prefix="/nurse",
    tags=["nurse"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


class Nurse(Employee):
    qualification: str
    license: str


@router.get('/')
def get_nurses():
    res = []
    cur.execute(" select * from NurseInfo")
    for ID, _, _, name, phone, email, _, sex in cur:
        res.append({
            'id': ID,
            'name': name,
            'phone': phone,
            'email': email,
            'sex': sex
        })
    return {
        'data': res,
        'key': ['ID', 'Name', 'Phone', 'Email', 'Sex']
    }


@router.get('/{pk}')
def get_nurse_info(pk):
    cur.execute(f"call NurseProfile({pk})")
    d = dict()
    for ID, qual, lic, name, phone, email, address, sex in cur:
        d = {
            'id': ID,
            'name': name,
            'phone': phone,
            'email': email,
            'address': address,
            'sex': sex,
            'qualification': qual,
            'license': lic
        }

    return d


@router.get('/dashboard/{pk}')
def nurse_dashboard(pk):
    res = []
    cur.execute(f"call DiagnosticsHistory({pk})")
    for _, dID, cat, diag in cur:
        res.append({
            'id': dID,
            'category': cat,
            'diagnostics': diag,
        })
    return {
        'data': res,
        'key': ['Diagnostics ID', 'Category', 'Diagnostics']
    }


@router.post('/add', status_code=201)
def new_nurse(data: Nurse):
    cur.callproc('addNurse', (data.name, data.password, data.phone,
                              data.email, data.address, data.sex,
                              data.salary, data.qualification, data.license, -1))
    result = cur.fetchall()
    cur.nextset()
    pk = result[0]
    return {'id': pk}


