# from fastapi import FastAPI, HTTPException, Depends
# from sqlalchemy.orm import Session
# from database import SessionLocal, engine
# import models, schemas

# # Buat tabel di database
# models.Base.metadata.create_all(bind=engine)

# app = FastAPI()

# # Dependency
# def get_db():
#     db = SessionLocal()
#     try:
#         yield db
#     finally:
#         db.close()

# @app.post("/todos/", response_model=schemas.Todo)
# def create_todo(todo: schemas.TodoCreate, db: Session = Depends(get_db)):
#     db_todo = models.Todo(
#         userId=todo.userId, 
#         title=todo.title, 
#         completed=todo.completed
#     )
#     db.add(db_todo)
#     db.commit()
#     db.refresh(db_todo)
#     return db_todo

# @app.get("/todos/{todo_id}", response_model=schemas.Todo)
# def read_todo(todo_id: int, db: Session = Depends(get_db)):
#     db_todo = db.query(models.Todo).filter(models.Todo.id == todo_id).first()
#     if db_todo is None:
#         raise HTTPException(status_code=404, detail="Todo not found")
#     return db_todo

# @app.get("/todos/", response_model=list[schemas.Todo])
# def read_todos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
#     todos = db.query(models.Todo).offset(skip).limit(limit).all()
#     return todos

# @app.put("/todos/{todo_id}", response_model=schemas.Todo)
# def update_todo(todo_id: int, todo: schemas.TodoCreate, db: Session = Depends(get_db)):
#     db_todo = db.query(models.Todo).filter(models.Todo.id == todo_id).first()
#     if db_todo is None:
#         raise HTTPException(status_code=404, detail="Todo not found")
#     db_todo.userId = todo.userId
#     db_todo.title = todo.title
#     db_todo.completed = todo.completed
#     db.commit()
#     db.refresh(db_todo)
#     return db_todo

# @app.delete("/todos/{todo_id}", response_model=schemas.Todo)
# def delete_todo(todo_id: int, db: Session = Depends(get_db)):
#     db_todo = db.query(models.Todo).filter(models.Todo.id == todo_id).first()
#     if db_todo is None:
#         raise HTTPException(status_code=404, detail="Todo not found")
#     db.delete(db_todo)
#     db.commit()
#     return db_todo

from fastapi import FastAPI, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from database import SessionLocal, engine
import models
import schemas
from fastapi.middleware.cors import CORSMiddleware

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Ganti dengan asal yang diizinkan
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/todos/", response_model=schemas.TodoInDB)
def create_todo(todo: schemas.TodoCreate, db: Session = Depends(get_db)):
    db_todo = models.TodoItem(**todo.dict())
    db.add(db_todo)
    db.commit()
    db.refresh(db_todo)
    return db_todo

@app.get("/todos/", response_model=List[schemas.TodoInDB])
def read_todos(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    todos = db.query(models.TodoItem).offset(skip).limit(limit).all()
    return todos

@app.get("/todos/{todo_id}", response_model=schemas.TodoInDB)
def read_todo(todo_id: int, db: Session = Depends(get_db)):
    todo = db.query(models.TodoItem).filter(models.TodoItem.id == todo_id).first()
    if todo is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    return todo

@app.put("/todos/{todo_id}", response_model=schemas.TodoInDB)
def update_todo(todo_id: int, todo: schemas.TodoUpdate, db: Session = Depends(get_db)):
    db_todo = db.query(models.TodoItem).filter(models.TodoItem.id == todo_id).first()
    if db_todo is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    for key, value in todo.dict().items():
        setattr(db_todo, key, value)
    db.commit()
    db.refresh(db_todo)
    return db_todo

@app.delete("/todos/{todo_id}", response_model=schemas.TodoInDB)
def delete_todo(todo_id: int, db: Session = Depends(get_db)):
    db_todo = db.query(models.TodoItem).filter(models.TodoItem.id == todo_id).first()
    if db_todo is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    db.delete(db_todo)
    db.commit()
    return db_todo
