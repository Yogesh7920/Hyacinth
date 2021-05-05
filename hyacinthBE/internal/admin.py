from fastapi import APIRouter
from database import Global

router = APIRouter(
    prefix="/admin",
    tags=["admin"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


@router.get('/')
def get_admin():
    res = []
    cur.execute(" select * from AdminInfo")
    for adminID, name, phone, email, address, sex in cur:
        res.append({
            'id': adminID,
            'name': name,
            'phone': phone,
            'email': email,
            'sex': sex
        })
    return res


@router.get('/{pk}')
def get_profile(pk):
    res = []
    cur.execute(f"call AdminProfile({pk})")
    for adminID, name, phone, email, address, sex in cur:
        res.append({
            'id': adminID,
            'name': name,
            'phone': phone,
            'email': email,
            'address': address,
            'sex': sex
        })
    return res


