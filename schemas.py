from pydantic import BaseModel, Field
from datetime import date

class UserSchema(BaseModel):
    username: str
    password: str
    c_password: str
    email: str
    nomor_hp: str
    jenis_user: str

class PersonalDataSchema(BaseModel):
    id_user: int
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

class BankSchema(BaseModel):
    nama_bank: str
    nomor_rekening: str
    nama_pemilik_umkm: str
    jenis_rekening: str

class WalletSchema(BaseModel):
    saldo: float

class RiwayatSaldoSchema(BaseModel):
    keterangan: str
    saldo_transaksi: float

class UMKMSchema(BaseModel):
    bentuk_umkm: str
    nama_umkm: str
    alamat_umkm: str
    kategori_umkm: str
    deskripsi_umkm: str
    kontak_umkm: str
    jumlah_karyawan: int
    omset_bulanan: float
    foto_umkm: str

class PinjamanSchema(BaseModel):
    jumlah_pinjaman: float
    tenor_pinjaman: str
    bunga_pinjaman: str
    frekuensi_angsuran_pokok: str
    tgl_pengajuan: date
    tgl_tenggang: date
    status_pinjaman: str
    tujuan_pinjaman: str
    pinjaman_terkumpul: float

class PendanaanSchema(BaseModel):
    jumlah_pendanaan: float
    status_pendanaan: str
    total_pembayaran: float
    curr_pembayaran: float

class PembayaranSchema(BaseModel):
    jumlah_pembayaran: float