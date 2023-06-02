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