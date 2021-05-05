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
    return res


@router.get('/{pk}')
def get_patient_info(pk):
    cur.execute(f"call PatientProfile({pk})")
    d = dict()
    for patientID, patientName, phone, email, address, sex, medicalHistory, marital in cur:
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
    return d


class Login(BaseModel):
    email: str
    password: str


@router.post('/login/')
def patient_login(data: Login):
    email = data.email
    password = data.password
    res = cur.callproc('PatientLogin', (email, password, True))
    pk = cur.fetchone()[0]
    return {'id': pk}


class Register(BaseModel):
    name: str
    email: str
    password: str
    phone: str
    address: str
    sex: str
    marital: str
    medical_history: Optional[str] = None


@router.post('/registration/')
def patient_registration(data: Register):
    res = cur.callproc('PatientRegistration',
                       (data.name, data.email, data.password, data.phone, data.address,
                        data.sex, data.medical_history, data.marital, True))
    pk = cur.fetchone()[0]
    return {'id': pk}


@router.get('/dashboard/{pk}')
def patient_dashboard(pk):
    res = []
    cur.execute(f"select * from PatientConsultInfo where patientID={pk}")
    for patID, docID, consID, problem, special in cur:
        res.append({
            'consultationID': consID,
            'problem': problem,
            'doctorID': docID,
            'patientID': patID,
            'specialization': special
        })
    return res
