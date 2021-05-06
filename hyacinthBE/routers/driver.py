from fastapi import APIRouter
from database import Global
from routers.employee import Employee

router = APIRouter(
    prefix="/driver",
    tags=["driver"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


class Driver(Employee):
    experience: int
    licenseNo: str
    successRate: float


@router.get('/')
def get_driver():
    res = []
    cur.execute(" select * from DriverInfo")
    for ID, name, phone, email, _, sex in cur:
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
def get_driver_info(pk):
    cur.execute(f"call DriverProfile({pk})")
    d = dict()
    for ID, name, phone, email, address, sex in cur:
        d = {
            'id': ID,
            'name': name,
            'phone': phone,
            'email': email,
            'address': address,
            'sex': sex
        }

    return d


@router.get('/dashboard/{pk}')
def driver_dashboard(pk):
    res = []
    cur.execute(f"call DriveRecords({pk})")
    for _, AID, maintenance, dist, start, end, address in cur:
        res.append({
            'id': AID,
            'lastMaintenance': maintenance,
            'totalDistance': dist,
            'startTime': start,
            'endTime': end,
            'address': address,
        })
    return {
        'data': res,
        'key': ['Ambulance ID', 'Last Maintenance', 'Total distance', 'Start time', 'End time', 'Address']
    }


@router.post('/add', status_code=201)
def new_driver(data: Driver):
    cur.callproc('addDriver', (data.name, data.password, data.phone,
                               data.email, data.address, data.sex, data.salary,
                               data.experience, data.licenseNo, data.successRate, -1))
    result = cur.fetchall()
    cur.nextset()
    pk = result[0]
    return {'id': pk}
