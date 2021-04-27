from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import doctor, nurse
from database import Global

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(doctor.router)
app.include_router(nurse.router)

cur = Global.cur


@app.get("/")
def read_root():
    return {"Hello": "Hyacinth"}


@app.get("/employees")
def get_employees():
    res = []
    cur.execute("select employeeID, name from Employee")
    for ID, name in cur:
        res.append({
            'id': ID,
            'name': name
        })
    return res


@app.post('/employee_registration')
def employee_registration(email, password):
    res = cur.callproc('EmployeeRegistration', (email, password, True))
    result = cur.fetchone()

    return {'role' :result}

