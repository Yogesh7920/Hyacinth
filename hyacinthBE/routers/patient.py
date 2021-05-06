from typing import Optional

from fastapi import APIRouter, Request
from database import Global
from pydantic import BaseModel

router = APIRouter(
    prefix="/patient",
    tags=["patient"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


@router.get('/')
def get_patient():
    res = []
    cur.execute(" select * from PatientInfo")
    for patientID, patientName, phone, email, _, sex, _, marital in cur:
        res.append({
            'id': patientID,
            'name': patientName,
            'phone': phone,
            'email': email,
            'sex': sex
        })
    return {
        'data': res,
        'key': ['ID', 'Name', 'Phone', 'Email', 'Sex']
    }


@router.get('/{pk}')
def get_patient_info(pk):
    cur.callproc('PatientProfile', (pk, ))
    result = cur.fetchall()
    result = result[0]
    d = dict()
    patientID, patientName, phone, email, address, sex, medicalHistory, marital = result
    d = {
        'id': patientID,
        'name': patientName,
        'phone': phone,
        'email': email,
        'address': address,
        'sex': sex,
        'medicalHistory': medicalHistory,
        'marital': marital
    }
    cur.nextset()
    return d


class Login(BaseModel):
    email: str
    password: str


@router.post('/login/')
def patient_login(data: Login):
    email = data.email
    password = data.password
    cur.callproc('PatientLogin', (email, password, -1))
    result = cur.fetchall()
    pk = result[0][0]
    cur.nextset()
    return {'id': pk, 'role': 'patient'}


class Register(BaseModel):
    name: str
    email: str
    password: str
    phone: str
    address: str
    sex: str
    marital: str
    medicalHistory: Optional[str] = None


@router.post('/registration/')
def patient_registration(data: Register):
    marital = 1 if data.marital == 1 else 0
    res = cur.callproc('PatientRegistration',
                       (data.name, data.email, data.password, data.phone, data.address,
                        data.sex, data.medicalHistory, marital, -1))
    result = cur.fetchall()
    id = result[0][0]
    cur.nextset()
    Global.conn.commit()
    return {'id': id}


@router.get('/dashboard/{pk}')
def patient_dashboard(pk):
    res = []
    cur.execute(f"select * from PatientConsultInfo where patientID={pk}")
    for patID, docID, consID, problem, special in cur:
        r = {
            'id': consID,
            'problem': problem,
            'doctorID': docID,
            'patientID': patID,
            'specialization': special
        }
        res.append(r)

    return {
        'data': res,
        'key': ['Consultation ID', 'Problem', 'Doctor ID', 'Patient ID', 'Specialization']
    }
