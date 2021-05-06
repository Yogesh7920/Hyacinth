from fastapi import APIRouter
from typing import Optional
from database import Global
from routers.employee import Employee

router = APIRouter(
    prefix="/doctor",
    tags=["doctor"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


class Doctor(Employee):
    qualification: str
    license: str
    bio: str
    available: Optional[int]
    specialization: str


@router.get('/')
def get_doctors():
    res = []
    cur.execute(" select * from DoctorInfo")
    for ID, _, _, _, _, _, name, phone, email, _, sex in cur:
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
def get_doctor_info(pk):
    cur.callproc('DoctorProfile', (pk,))
    result = cur.fetchall()
    d = dict()
    for ID, qual, lic, bio, available, special, name, phone, email, address, sex in result:
        d = {
            'id': ID,
            'name': name,
            'phone': phone,
            'email': email,
            'address': address,
            'sex': sex,
            'qualification': qual,
            'license': lic,
            'bio': bio,
            'available': available,
            'specialization': special
        }
    cur.nextset()
    return d


@router.get('/dashboard/{pk}')
def get_dashboard(pk):
    cur.execute(f"select * from PatientConsultInfo where doctorID={pk}")
    res = []
    for patientID, name,  _, _, consultationID, problem, specialization in cur:
        res.append({
            "id": consultationID,
            "patientID": patientID,
            "name": name,
            "problem": problem,
        })

    return {
        'data': res,
        'key': ['Consultation ID', 'Patient ID', 'Patient Name', 'Problem']
    }


@router.post('/add', status_code=201)
def new_doctor(data: Doctor):
    cur.callproc('addDoctor', (data.name, data.password, data.phone,
                              data.email, data.address, data.sex,
                              data.salary, data.qualification, data.license,
                               data.bio, data.available, data.specialization, -1))
    result = cur.fetchall()
    cur.nextset()
    pk = result[0]
    return {'id': pk}
