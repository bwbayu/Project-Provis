from sqlalchemy import Column, Integer, String, Date, ForeignKey, Numeric, Text
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
    banks = relationship('BankModel', back_populates='user')
    wallet = relationship('WalletModel', uselist=False, back_populates='user')
    penyedia_dana = relationship('PenyediaDanaModel', uselist=False, back_populates='user_model')
    pemilik_umkm = relationship('PemilikUmkmModel', uselist=False, back_populates='user_model')

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

class BankModel(Base):
    __tablename__ = 'bank'
    bank_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.user_id'), nullable=False)
    nama_bank = Column(String(100), nullable=False)
    nomor_rekening = Column(String(100), nullable=False)
    nama_pemilik_umkm = Column(String(100), nullable=False)
    jenis_rekening = Column(String(100), nullable=False)

    user = relationship('UserModel', back_populates='banks')

class WalletModel(Base):
    __tablename__ = 'wallet'

    wallet_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.user_id'), unique=True)
    saldo = Column(Numeric(precision=12, scale=2), nullable=False)

    user = relationship('UserModel', back_populates='wallet')
    riwayat_saldo = relationship('RiwayatSaldoModel', back_populates='wallet')

class RiwayatSaldoModel(Base):
    __tablename__ = 'riwayatSaldo'
    id_riwayat = Column(Integer, primary_key=True, autoincrement=True)
    wallet_id = Column(Integer, ForeignKey('wallet.wallet_id'))
    keterangan = Column(String(100), nullable=False)
    saldo_transaksi = Column(Numeric(precision=12, scale=2), nullable=False)

    wallet = relationship('WalletModel', back_populates='riwayat_saldo')

class PenyediaDanaModel(Base):
    __tablename__ = 'penyediaDana'
    
    funder_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.user_id'), unique=True)

    user_model = relationship('UserModel', back_populates='penyedia_dana')
    pendanaan_model = relationship('PendanaanModel', back_populates='funder_model')

class PemilikUmkmModel(Base):
    __tablename__ = 'pemilikUMKM'
    
    pemilik_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.user_id'), unique=True)

    user_model = relationship('UserModel', back_populates='pemilik_umkm')
    umkm = relationship('UMKMModel', back_populates='pemilik_umkm')

class UMKMModel(Base):
    __tablename__ = 'umkm'

    umkm_id = Column(Integer, primary_key=True, autoincrement=True)
    pemilik_id = Column(Integer, ForeignKey('pemilikUMKM.pemilik_id'))
    bentuk_umkm = Column(String(100), nullable=False)
    nama_umkm = Column(String(100), nullable=False)
    alamat_umkm = Column(String(100), nullable=False)
    kategori_umkm = Column(String(100), nullable=False)
    deskripsi_umkm = Column(Text, nullable=False)
    kontak_umkm = Column(String(100), nullable=False)
    jumlah_karyawan = Column(Integer, nullable=False)
    omset_bulanan = Column(Numeric(precision=12, scale=2), nullable=False)
    foto_umkm = Column(String(100), nullable=False)

    pemilik_umkm = relationship('PemilikUmkmModel', back_populates='umkm')
    pinjaman_model = relationship('PinjamanModel', back_populates='umkm_model')

class PinjamanModel(Base):
    __tablename__ = 'pinjaman'

    pinjaman_id = Column(Integer, primary_key=True, autoincrement=True)
    umkm_id = Column(Integer, ForeignKey('umkm.umkm_id'))
    jumlah_pinjaman = Column(Numeric(precision=8, scale=2), nullable=False)
    tenor_pinjaman = Column(String(20), nullable=False)
    bunga_pinjaman = Column(String(20), nullable=False)
    frekuensi_angsuran_pokok = Column(String(20), nullable=False)
    tgl_pengajuan = Column(Date, nullable=False)
    tgl_tenggang = Column(Date, nullable=False)
    status_pinjaman = Column(String(20), nullable=False)
    tujuan_pinjaman = Column(Text, nullable=False)
    pinjaman_terkumpul = Column(Numeric(precision=8, scale=2), nullable=False)

    umkm_model = relationship('UMKMModel', back_populates='pinjaman_model')
    pendanaan_model = relationship('PendanaanModel', back_populates='pinjaman_model')
    pembayaran_model = relationship('PembayaranModel', back_populates='pinjaman_model')

class PendanaanModel(Base):
    __tablename__ = 'pendanaan'

    pendanaan_id = Column(Integer, primary_key=True, autoincrement=True)
    funder_id = Column(Integer, ForeignKey('penyediaDana.funder_id'))
    pinjaman_id = Column(Integer, ForeignKey('pinjaman.pinjaman_id'))
    jumlah_pendanaan = Column(Numeric(precision=12, scale=2), nullable=False)
    status_pendanaan = Column(String(20), nullable=False)
    total_pembayaran = Column(Numeric(precision=12, scale=2), nullable=False)
    curr_pembayaran = Column(Numeric(precision=12, scale=2), nullable=False)

    funder_model = relationship('PenyediaDanaModel', back_populates='pendanaan_model')
    pinjaman_model = relationship('PinjamanModel', back_populates='pendanaan_model')

class PembayaranModel(Base):
    __tablename__ = 'pembayaran'

    pembayaran_id = Column(Integer, primary_key=True, autoincrement=True)
    pinjaman_id = Column(Integer, ForeignKey('pinjaman.pinjaman_id'))
    jumlah_pembayaran = Column(Numeric(precision=12, scale=2), nullable=False)

    pinjaman_model = relationship('PinjamanModel', back_populates='pembayaran_model')