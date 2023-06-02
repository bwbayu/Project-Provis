from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# created database engine
engine = create_engine('sqlite:///db_provis_1.db')
Base = declarative_base()

SessionLocal = sessionmaker(bind=engine, expire_on_commit=False)