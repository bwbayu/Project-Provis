from pydantic import BaseModel
from datetime import date

class UserSchema(BaseModel):
    username: str
    password: str
    c_password: str
    email: str
    nomor_hp: str
    jenis_user: str

class PersonalDataSchema(BaseModel):
    foto_ktp: str
    foto_npwp: str
    ttd: str
    nama: str
    tempat_lahir: str
    tgl_lahir: date
    jenis_kelamin: str
    agama: str
    status_perkawinan: str
    pend_terakhir: str
    alamat: str
    status_kewarganegaraan: str