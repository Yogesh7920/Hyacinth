from fastapi import FastAPI
import mariadb
import sys
import os

app = FastAPI()
try:
    # conn = mariadb.connect(
    #     user=os.getenv("USER", "root"),
    #     password=os.getenv("PASSWORD", "maria"),
    #     host=os.getenv("HOST", "hyacinthDB"),
    #     port=int(os.getenv("PORT", "3306")),
    #     database=os.getenv("DB", "Hyacinth")
    # )
    conn = mariadb.connect(
        user="root",
        password="maria",
        host="hyacinthDB",
        port=3306,
        database="Hyacinth"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()


@app.get("/")
def read_root():
    return {"Hello": "Hyacinth"}


@app.get("/employees")
def get_students():
    res = []
    cur.execute(" select employeeID, name from Employee")
    for ID, name in cur:
        res.append({
            'id': ID,
            'name': name
        })
    return res
