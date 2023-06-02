from fastapi import FastAPI, Body, Depends
import schemas
import models
# database
from database import Base, engine, SessionLocal
from sqlalchemy.orm import Session

# create local db
Base.metadata.create_all(engine)

# create session for db
def get_session():
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()

# API METHOD
app = FastAPI()

# ==================================== USER =================================================
# GET ALL USER
@app.get("/getUser")
def get_user(session: Session = Depends(get_session)):
    users = session.query(models.UserModel).all()
    return {"user": users}

# ADD USER
@app.post("/addUser")
def add_user(user: schemas.UserSchema, session: Session = Depends(get_session)):
    user_data = models.UserModel(**user.dict())
    session.add(user_data)
    session.commit()
    session.refresh(user_data)
    return user_data

# GET USER BY ID
@app.get("/getUser/{user_id}")
def get_user_by_id(user_id: int, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    return {"user": db_user}

# UPDATE USER
@app.put("/updateUser/{user_id}")
def update_user(user_id: int, user: schemas.UserSchema, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    if db_user:
        # Update the user object with the provided data
        db_user.username = user.username
        db_user.password = user.password
        db_user.c_password = user.c_password
        db_user.email = user.email
        db_user.nomor_hp = user.nomor_hp
        db_user.jenis_user = user.jenis_user

        session.commit()
        session.refresh(db_user)
        return db_user

    return {"message": "User not found"}

# DELETE USER
@app.delete("/deleteUser/{user_id}")
def delete_user(user_id: int, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    if db_user:
        session.delete(db_user)
        session.commit()
        session.close()
        return {"message": "User was deleted successfully"}
    return {"message": "User not found"}

# ==================================== Personal Data =================================================
# GET ALL PERSONAL DATA OF USER
@app.get("/getPersonalData")
def get_personal_data(session: Session = Depends(get_session)):
    personal_data = session.query(models.PersonalDataModel).all()
    return {"personal_data": personal_data}


# ADD PERSONAL DATA
@app.post("/addPersonalData/{user_id}")
def add_personal_data(user_id:int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    personal_data = models.PersonalDataModel(**personal_data.dict())
    personal_data.user_id = user_id
    session.add(personal_data)
    session.commit()
    session.refresh(personal_data)
    return personal_data

# GET PERSONAL DATA BY ID
@app.get("/getPersonalData/{personalData_id}")
def get_personal_data_by_id(personalData_id: int, session: Session = Depends(get_session)):
    personal_data = session.query(models.PersonalDataModel).get(personalData_id)
    return {"personal_data": personal_data}

# UPDATE PERSONAL DATA
@app.put("/updatePersonalData/{personalData_id}")
def update_personal_data(personalData_id: int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    db_personal_data = session.query(models.PersonalDataModel).get(personalData_id)
    if db_personal_data:
        # Update the user object with the provided data
        db_personal_data.nama = personal_data.nama
        db_personal_data.tempat_lahir = personal_data.tempat_lahir
        db_personal_data.tgl_lahir = personal_data.tgl_lahir
        db_personal_data.jenis_kelamin = personal_data.jenis_kelamin
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.agama = personal_data.agama
        db_personal_data.status_perkawinan = personal_data.status_perkawinan
        db_personal_data.pend_terakhir = personal_data.pend_terakhir
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.status_kewarganegaraan = personal_data.status_kewarganegaraan
        session.commit()
        session.refresh(db_personal_data)
        return db_personal_data
    return {"message": "User not found"}

# DELETE PERSONAL DATA
@app.delete("/deletePersonalData/{personalData_id}")
def delete_personal_data(personalData_id: int, session: Session = Depends(get_session)):
    db_personal_data = session.query(models.PersonalDataModel).get(personalData_id)
    if db_personal_data:
        session.delete(db_personal_data)
        session.commit()
        session.close()
        return {"message": "User was deleted successfully"}
    return {"message": "User not found"}