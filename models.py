from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class UserModel(Base):
    __tablename__ = 'user'
    user_id = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(String(100), nullable=False)
    password = Column(String(100), nullable=False)
    c_password = Column(String(100), nullable=False)
    email = Column(String(100), nullable=False)
    nomor_hp = Column(String(100), nullable=False)
    jenis_user = Column(String(20), nullable=False)
    
    personal_data = relationship('PersonalDataModel', uselist=False, back_populates='user')

class PersonalDataModel(Base):
    __tablename__ = 'personalData'
    personaldata_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.user_id'), unique=True)
    foto_ktp = Column(String(100), nullable=False)
    foto_npwp = Column(String(100), nullable=False)
    ttd = Column(String(100), nullable=False)
    nama = Column(String(100), nullable=False)
    tempat_lahir = Column(String(100), nullable=False)
    tgl_lahir = Column(Date, nullable=False)
    jenis_kelamin = Column(String(20), nullable=False)
    agama = Column(String(20), nullable=False)
    status_perkawinan = Column(String(20), nullable=False)
    pend_terakhir = Column(String(100), nullable=False)
    alamat = Column(String(100), nullable=False)
    status_kewarganegaraan = Column(String(10), nullable=False)
    
    user = relationship('UserModel', back_populates='personal_data')