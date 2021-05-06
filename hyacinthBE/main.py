from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from database import Global
from internal import admin
from routers import employee, doctor, nurse, driver, patient, vendor

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(employee.router)
app.include_router(doctor.router)
app.include_router(nurse.router)
app.include_router(driver.router)
app.include_router(patient.router)
app.include_router(admin.router)
app.include_router(vendor.router)

cur = Global.cur


@app.get("/")
def read_root():
    return {"Hello": "Hyacinth"}


@app.get("/consultation/{pk}")
def consultation(pk):
    cur.execute(f"select * from AppointmentInvoice where consultationId={pk}")
    res = []
    for _, appID, startTime, endTime, remarks, invoiceID, presID, amount, isPaid in cur:
        res.append({
            'id': appID,
            'startTime': startTime,
            'endTime': endTime,
            'remarks': remarks,
            'invoiceID': invoiceID,
            'presID': presID,
            'amount': amount,
            'isPaid': isPaid,
        })
    return {
        'data': res,
        'key': ['ID', 'Start Time', 'End Time', 'Remarks', 'Invoice ID', 'Prescription ID', 'Amount', 'isPaid']
    }


@app.get('/prescription/{pk}')
def prescription_detail(pk):
    cur.execute(f"select * from PrescriptionDrug where prescriptionID={pk}")
    res1 = []
    for pharmID, _, timeStamp, name, cat in cur:
        res1.append({
            'pharmacyID': pharmID,
            'timeStamp': timeStamp,
            'name': name,
            'category': cat
        })

    cur.execute(f"select * from PrescriptionDiagnostic where prescriptionID={pk}")
    res2 = []
    for diagID, _, timeStamp, cat, name in cur:
        res2.append({
            'diagnosticsID': diagID,
            'timeStamp': timeStamp,
            'name': name,
            'category': cat
        })

    return {
        'drugs': res1,
        'diagnostics': res2
    }
