from fastapi import APIRouter
from database import Global


router = APIRouter(
    prefix="/nurse",
    tags=["nurse"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


@router.get('/')
def get_nurses():
    res = []
    cur.execute(" select * from NurseInfo")
    for ID, _, _, name, phone, email, _, sex in cur:
        res.append({
            'ID': ID,
            'name': name,
            'phone': phone,
            'email': email,
            'sex': sex
        })
    return res


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
