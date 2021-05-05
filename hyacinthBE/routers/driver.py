from fastapi import APIRouter
from database import Global


router = APIRouter(
    prefix="/driver",
    tags=["driver"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


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
    return res


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
            'ambulanceID': AID,
            'lastMaintenance': maintenance,
            'totalDistance': dist,
            'startTime': start,
            'endTime': end,
            'address': address,
        })
    return res


