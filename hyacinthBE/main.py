from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
import mariadb
import sys
import os
from routers import doctor, nurse
from database import Global

app = FastAPI()
app.include_router(doctor.router)
app.include_router(nurse.router)

cur = Global.cur


@app.get("/")
def read_root():
    return {"Hello": "Hyacinth"}


@app.get("/employees")
def get_employees():
    res = []
    cur.execute(" select employeeID, name from Employee")
    for ID, name in cur:
        res.append({
            'id': ID,
            'name': name
        })
    return res
