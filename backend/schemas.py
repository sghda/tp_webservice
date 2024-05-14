# from pydantic import BaseModel

# class TodoBase(BaseModel):
#     userId: int
#     title: str
#     completed: bool

# class TodoCreate(TodoBase):
#     pass

# class Todo(TodoBase):
#     id: int

#     class Config:
#         orm_mode = True

from pydantic import BaseModel

class TodoBase(BaseModel):
    userId: int
    id: int
    title: str
    completed: bool
    abstract: str
    content: str

class TodoCreate(TodoBase):
    pass

class TodoUpdate(TodoBase):
    pass

class TodoInDB(TodoBase):
    id: int

    class Config:
        orm_mode = True
