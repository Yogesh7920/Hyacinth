from fastapi import APIRouter
from database import Global

router = APIRouter(
    prefix="/doctor",
    tags=["doctor"],
    responses={404: {"description": "Not found"}}
)

cur = Global.cur


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
    return res


@router.get('/{pk}')
def get_doctor_info(pk):
    cur.execute(f"call DoctorProfile({pk})")
    d = dict()
    for ID, qual, lic, bio, available, special, name, phone, email, address, sex in cur:
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

    return d

@router.get('/dashboard/{pk}')
def get_dashboard(pk):
    cur.execute(f"select * from PatientConsultInfo where doctorID={pk}")
    res = []
    for patientID, _ , consultationID, problem, specialization in cur:
        res.append({
                "patientID": patientID,
                "consultationID": consultationID,
                "specialization": specialization,
                "problem":problem,
                "patientID": patientID,
            })

    print(res)
    return res