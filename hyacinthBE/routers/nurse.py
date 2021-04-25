import os
import sys

from fastapi import APIRouter
import mariadb

router = APIRouter(
    prefix="/nurse",
    tags=["nurse"],
    responses={404: {"description": "Not found"}}
)

try:
    user = os.getenv("DB_USER", "root")
    password = os.getenv("DB_PASSWORD", "password")
    host = os.getenv("DB_HOST", "localhost")
    port = int(os.getenv("DB_PORT", "3306"))
    database = os.getenv("DB", "Hyacinth")
    conn = mariadb.connect(
        user=user,
        password=password,
        host=host,
        port=port,
        database=database
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()


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
