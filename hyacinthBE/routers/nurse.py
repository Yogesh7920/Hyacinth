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
