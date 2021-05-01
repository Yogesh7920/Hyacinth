from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import employee, doctor, nurse, driver, patient

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


@app.get("/")
def read_root():
    return {"Hello": "Hyacinth"}
