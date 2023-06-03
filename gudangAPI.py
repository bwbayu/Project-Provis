# @app.get("/")
# def getItems(session: Session = Depends(get_session)):
#     items = session.query(models.Item).all()
#     return items

# @app.post("/")
# def addItem(item:schemas.Item, session: Session = Depends(get_session)):
#     item = models.Item(task=item.task)
#     session.add(item) # add item to database
#     session.commit()  # commit
#     session.refresh(item) # refresh item    
#     return item

# @app.get('/{id}')
# def getItembyId(id:int, session: Session = Depends(get_session)):
#     item = session.query(models.Item).get(id)
#     return item

# @app.put('/{id}')
# def updateItem(id:int, item:schemas.Item, session: Session = Depends(get_session)):
#     tempItem = session.query(models.Item).get(id) # ambil id dari item
#     tempItem.task = item.task # update the task from that id
#     session.commit() # commit
#     return tempItem

# @app.delete('/{id}')
# def deleteItem(id:int, session: Session = Depends(get_session)):
#     tempItem = session.query(models.Item).get(id) # ambil id dari item
#     session.delete(tempItem) # delete item
#     session.commit() # commit
#     session.close()
#     return "Item was deleted successfully"

# with schema
# @app.post("/")
# def addItem(item:schemas.Item):
#     newId = len(fakeDB.keys()) + 1
#     fakeDB[newId] = {'task': item.task}
#     return fakeDB

# with parameter
# @app.post("/")
# def addItem(item:str, rating:int):
#     newId = len(fakeDB.keys()) + 1
#     fakeDB[newId] = {'task': item, 'rating': rating}
#     return fakeDB

# with body
# @app.post("/")
# def addItem(body= Body()):
#     newId = len(fakeDB.keys()) + 1
#     fakeDB[newId] = {'task': body['task']}
#     return fakeDB

# # UPDATE USER
# @app.put("/updateUser/{user_id}")
# def update_user(user_id: int, user: schemas.UserSchema, session: Session = Depends(get_session)):
#     db_user = session.query(models.UserModel).get(user_id)
#     if db_user:
#         # Update the user object with the provided data
#         db_user.username = user.username
#         db_user.password = user.password
#         db_user.c_password = user.c_password
#         db_user.email = user.email
#         db_user.nomor_hp = user.nomor_hp
#         db_user.jenis_user = user.jenis_user

#         session.commit()
#         session.refresh(db_user)
#         return db_user

#     return {"message": "User not found"}

# # DELETE USER
# @app.delete("/deleteUser/{user_id}")
# def delete_user(user_id: int, session: Session = Depends(get_session)):
#     db_user = session.query(models.UserModel).get(user_id)
#     if db_user:
#         session.delete(db_user)
#         session.commit()
#         session.close()
#         return {"message": "User was deleted successfully"}
#     return {"message": "User not found"}

# # UPDATE PERSONAL DATA
# @app.put("/updatePersonalData/{personalData_id}")
# def update_personal_data(personalData_id: int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
#     db_personal_data = session.query(models.PersonalDataModel).get(personalData_id)
#     if db_personal_data:
#         # Update the user object with the provided data
#         db_personal_data.nama = personal_data.nama
#         db_personal_data.tempat_lahir = personal_data.tempat_lahir
#         db_personal_data.tgl_lahir = personal_data.tgl_lahir
#         db_personal_data.jenis_kelamin = personal_data.jenis_kelamin
#         db_personal_data.alamat = personal_data.alamat
#         db_personal_data.agama = personal_data.agama
#         db_personal_data.status_perkawinan = personal_data.status_perkawinan
#         db_personal_data.pend_terakhir = personal_data.pend_terakhir
#         db_personal_data.alamat = personal_data.alamat
#         db_personal_data.status_kewarganegaraan = personal_data.status_kewarganegaraan
#         session.commit()
#         session.refresh(db_personal_data)
#         return db_personal_data
#     return {"message": "User not found"}

# # DELETE PERSONAL DATA
# @app.delete("/deletePersonalData/{personalData_id}")
# def delete_personal_data(personalData_id: int, session: Session = Depends(get_session)):
#     db_personal_data = session.query(models.PersonalDataModel).get(personalData_id)
#     if db_personal_data:
#         session.delete(db_personal_data)
#         session.commit()
#         session.close()
#         return {"message": "User was deleted successfully"}
#     return {"message": "User not found"}

# # GET ALL BANK DATA
# @app.get("/getBank")
# def get_bank(session: Session = Depends(get_session)):
#     bank_data = session.query(models.BankModel).all()
#     return {"bank": bank_data}

# # GET ALL PERSONAL DATA OF USER
# @app.get("/getPersonalData")
# def get_personal_data(session: Session = Depends(get_session)):
#     personal_data = session.query(models.PersonalDataModel).all()
#     return {"personal_data": personal_data}

# # ADD WALLET
# @app.post("/addWallet")
# def add_wallet(wallet_data: schemas.WalletSchema, user_id: int, session=Depends(get_session)):
#     user = session.query(models.UserModel).get(user_id)
#     if user is None:
#         return {"error": "User not found"}
#     wallet = models.WalletModel(**wallet_data.dict(), user_id=user_id)
#     session.add(wallet)
#     session.commit()
#     session.refresh(wallet)
#     return {"wallet": wallet}