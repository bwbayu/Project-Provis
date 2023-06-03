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