from fastapi import APIRouter
from database import Global

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


@router.post('/login')
def patient_login(email, password):
    res = cur.callproc('PatientLogin', (email, password, True))
    pk = cur.fetchone()[0]
    return {'id': pk}


@router.post('/registration')
def patient_registration(name, email, password, phone, address, sex, marital, medical_history=None):
    res = cur.callproc('PatientRegistration',
                       (name, email, password, phone, address, sex, medical_history, marital, True))
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

