# from sqlalchemy import Column, Integer, String, Boolean
# from database import Base

# class Todo(Base):
#     __tablename__ = "todos"

#     id = Column(Integer, primary_key=True, index=True)
#     userId = Column(Integer, index=True)
#     title = Column(String, index=True)
#     completed = Column(Boolean, default=False)

from sqlalchemy import Column, Integer, String, Boolean
from database import Base

class TodoItem(Base):
    __tablename__ = "todos"

    id = Column(Integer, primary_key=True, index=True)
    userId = Column(Integer, index=True)
    title = Column(String, index=True)
    completed = Column(Boolean, default=False)
    abstract = Column(String, index=True)
    content = Column(String, index=True)
