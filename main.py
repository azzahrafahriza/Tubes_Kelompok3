# conda activate webservicep2plending webservicep2plending
# uvicorn main:app --reload


from typing import Union
from fastapi import FastAPI,Response,Request,HTTPException
from fastapi.middleware.cors import CORSMiddleware
import sqlite3

app = FastAPI()

app.add_middleware(
	CORSMiddleware,
	allow_origins=["*"],
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"],
)


# @app.get("/")
# def read_root():
#     return {"Hello": "World"}

# @app.get("/mahasiswa/{nim}")
# def ambil_mhs(nim:str):
#     return {"nama": "Budi Martami"}

# @app.get("/mahasiswa2/")
# def ambil_mhs2(nim:str):
#     return {"nama": "Budi Martami 2"}   

# @app.get("/daftar_mhs/")
# def daftar_mhs(id_prov:str,angkatan:str):
#     return {"query":" idprov: {}  ; angkatan: {} ".format(id_prov,angkatan),"data":[{"nim":"1234"},{"nim":"1235"}]}

# panggil sekali saja
@app.get("/init/")
def init_db():
  try:
    DB_NAME = "user.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    create_table = """ CREATE TABLE user(
            ID      	INTEGER PRIMARY KEY 	AUTOINCREMENT,
            nama            TEXT                NOT NULL,
            nama_umkm       TEXT                NOT NULL,
            email           TEXT                NOT NULL UNIQUE,
            password    	TEXT            	NOT NULL,
            no_telp         TEXT                NOT NULL,
            saldo           INT                 NULL
        );

        CREATE TABLE peminjaman(
            ID              INTEGER             NOT NULL,
            jumlah_pinjaman INTEGER             NOT NULL,
            jumlah_tagihan  INTEGER             NOT NULL,
            tagihan_bulanan INTEGER             NOT NULL,
            jangka_waktu    TEXT                NOT NULL,
            status          TEXT                NOT NULL 
        );
        """
    cur.executescript(create_table)
    con.commit()
  except:
           return ({"status":"terjadi error"})  
  finally:
           con.close()
    
  return ({"status":"ok, db dan tabel berhasil dicreate"})

from typing import Optional

from pydantic import BaseModel

class Mhs(BaseModel):
   nama: str
   nama_umkm: str
   password: str
   email: str
   no_telp: str


#status code 201 standard return creation
#return objek yang baru dicreate (response_model tipenya Mhs)
@app.post("/tambah_user/", response_model=Mhs,status_code=201)  
def tambah_user(m: Mhs,response: Response, request: Request):
   try:
       DB_NAME = "user.db"
       con = sqlite3.connect(DB_NAME)
       cur = con.cursor()
       # hanya untuk test, rawal sql injecttion, gunakan spt SQLAlchemy
       cur.execute("""insert into user (nama,nama_umkm,email,password,no_telp,saldo) values ( "{}","{}","{}","{}","{}",0)""".format(m.nama,m.nama_umkm,m.email,m.password,m.no_telp))
       con.commit() 
   except:
       print("oioi error")
       return ({"status":"terjadi error"})   
   finally:  	 
       con.close()
   response.headers["Location"] = "/user/{}".format(m.email) 
   print(m.nama)
   print(m.nama_umkm)
   print(m.email)
   print(m.password)
   print(m.no_telp)
  
   return m

@app.get("/tampilkan_semua_user/")
def tampil_semua_user():
   try:
    DB_NAME = "user.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    recs = []
    for row in cur.execute("select * from user"):
        recs.append(row)
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
   return {"data":recs}

@app.delete("/delete_user/{ID}")
def delete_user(id: str):
    try:
       DB_NAME = "user.db"
       con = sqlite3.connect(DB_NAME)
       cur = con.cursor()
       sqlstr = "delete from user  where id='{}'".format(id)                 
       print(sqlstr) # debug 
       cur.execute(sqlstr)
       con.commit()
    except:
       return ({"status":"terjadi error"})   
    finally:  	 
       con.close()
    
    return {"status":"ok"}

# @app.get("/tampilkan_semua_user/{id}")
# def tampil_mhs_by_id(id: int):
#     try:
#         DB_NAME = "upi.db"
#         con = sqlite3.connect(DB_NAME)
#         cur = con.cursor()
#         recs = []
#         for row in cur.execute("SELECT * FROM user WHERE ID=?", (id)):
#             recs.append(row)
#     except:
#         return {"status": "Terjadi error"}
#     finally:
#         con.close()
#     return {"data": recs}
