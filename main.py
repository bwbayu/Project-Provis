from decimal import Decimal
from fastapi import FastAPI, Body, Depends, Response, Request, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi import File, UploadFile
import secrets
from fastapi.staticfiles import StaticFiles
from PIL import Image
import os
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from typing import Union
import schemas
import models
import bcrypt
from datetime import datetime, timedelta
import jwt
from fastapi.responses import FileResponse
# database
from database import Base, engine, SessionLocal
from sqlalchemy.orm import Session
from sqlalchemy.sql.expression import or_

# create local db
Base.metadata.create_all(engine)

# Secret key for encoding/decoding JWT tokens
SECRET_KEY = "your-secret-key"


# create session for db
def get_session():
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()


# API METHOD
app = FastAPI()

# statis file setup config
static_dir = os.path.join(os.path.dirname(
    os.path.abspath(__file__)), "percobaan_4/asset")
app.mount("/asset", StaticFiles(directory=static_dir), name="asset")

# Set CORS policies
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["GET", "PUT", "POST", "DELETE"],
    allow_headers=["*"],
)

# ==================================== USER =================================================
# GET ALL USER


@app.get("/getUser")
def get_user(session: Session = Depends(get_session)):
    users = session.query(models.UserModel).all()
    return {"user": users}

# ADD USER (page register)


@app.post("/addUser")
async def add_user(user: schemas.UserSchema, db: Session = Depends(get_session)):
    try:
        print("Adding user:", user.username)  # Debugging statement

        # Check if email or phone number already exists
        existing_user = db.query(models.UserModel).filter(or_(
            models.UserModel.email == user.email,
            models.UserModel.nomor_hp == user.nomor_hp
        )).first()
        if existing_user:
            raise HTTPException(
                status_code=400, detail="Email or phone number already exists")

        # Hash the password
        hashed_password = bcrypt.hashpw(
            user.password.encode('utf-8'), bcrypt.gensalt())

        # create new user
        user_data = models.UserModel(
            username=user.username,
            password=hashed_password,
            c_password=hashed_password,
            email=user.email,
            nomor_hp=user.nomor_hp,
            jenis_user=user.jenis_user,
            status_akun="Not Verified",
        )
        db.add(user_data)
        db.commit()
        db.refresh(user_data)

        # Create new personal data for the user
        personal_data = models.PersonalDataModel(
            user_id=user_data.user_id,
            nama="",
            foto_ktp="",
            foto_npwp="",
            ttd="",
            tempat_lahir="",
            tgl_lahir="",
            jenis_kelamin="",
            alamat="",
            agama="",
            status_perkawinan="",
            pend_terakhir="",
            status_kewarganegaraan="",
            nomor_npwp="",
            pemilik_npwp=""
        )
        db.add(personal_data)
        db.commit()
        db.refresh(personal_data)

        # Create new wallet for the user
        wallet = models.WalletModel(user_id=user_data.user_id, saldo=0)
        db.add(wallet)
        db.commit()
        db.refresh(wallet)

        if user_data.jenis_user == "Investor":
            # Create new data penyediaDana for the user
            penyedia_dana = models.PenyediaDanaModel(user_id=user_data.user_id)
            db.add(penyedia_dana)
            db.commit()
            db.refresh(penyedia_dana)
        elif user_data.jenis_user == "Borrower":
            # Create new data pemilikUMKM for the user
            pemilik_umkm = models.PemilikUmkmModel(user_id=user_data.user_id)
            db.add(pemilik_umkm)
            db.commit()
            db.refresh(pemilik_umkm)
            # Create new data Umkm for borrower
            umkm = models.UMKMModel(pemilik_id=pemilik_umkm.pemilik_id)
            db.add(umkm)
            db.commit()
            db.refresh(umkm)

    except Exception as e:
        print("Error:", e)  # Debugging statement
        db.rollback()
        raise HTTPException(status_code=400, detail=str(e))

    finally:
        db.close()

    return {"message": "User data added successfully"}

# LOGIN


@app.post("/login")
async def login(user: schemas.LoginSchema, db: Session = Depends(get_session)):
    user_data = db.query(models.UserModel).filter(
        models.UserModel.email == user.email).first()
    if user_data is None:
        raise HTTPException(status_code=404, detail="User not found")
    if not bcrypt.checkpw(user.password.encode('utf-8'), user_data.password):
        raise HTTPException(status_code=401, detail="Incorrect password")

    # Set expiration time (1 hour from now)
    exp = datetime.utcnow() + timedelta(hours=1)

    # Generate JWT token
    token_data = {
        "user_id": user_data.user_id,
        "email": user_data.email,
        "exp": exp
    }
    token = jwt.encode(token_data, SECRET_KEY, algorithm="HS256")

    return {
        "message": "Login success",
        "token": token,
        "user_id": user_data.user_id,
        "jenis_user": user_data.jenis_user
    }

# GET USER BY ID


@app.get("/getUserById/{user_id}")
def get_user_by_id(user_id: int, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    return {"user": db_user}

# UPDATE STATUS AKUN


@app.put("/updateStatusAkun/{user_id}")
def update_status_akun(user_id: int, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    if db_user is None:
        return {"message": "User not found"}

    db_personal_data = session.query(
        models.PersonalDataModel).filter_by(user_id=user_id).first()
    all_variables_not_empty = True
    for variable in db_personal_data.__dict__:
        if isinstance(db_personal_data.__dict__[variable], str) and db_personal_data.__dict__[variable] == "":
            all_variables_not_empty = False
            break

    if db_user.jenis_user == "Borrower":
        pemilik_umkm = session.query(
            models.PemilikUmkmModel).filter_by(user_id=user_id).first()
        if pemilik_umkm is None:
            return {"message": "Pemilik UMKM not found"}

        db_umkm_user = session.query(models.UMKMModel).filter_by(
            pemilik_id=pemilik_umkm.pemilik_id).first()
        if db_umkm_user is None:
            return {"message": "UMKM not found"}

        for variable in db_umkm_user.__dict__:
            if db_umkm_user.__dict__[variable] == None:
                all_variables_not_empty = False
                break
    if all_variables_not_empty:
        db_user.status_akun = "Verified"
        session.commit()
        session.refresh(db_user)
        return {"message": "Account status updated successfully."}
    else:
        db_user.status_akun = "Not Verified"
        session.commit()
        session.refresh(db_user)
        return {"message": "One or more personal data variables are empty."}

# ==================================== Personal Data =================================================
# UPDATE PERSONAL DATA (page ktp, npwp, ttd, data_diri)


@app.put("/updatePersonalData/{user_id}")
def update_personal_data(user_id: int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    db_personal_data = session.query(
        models.PersonalDataModel).filter_by(user_id=user_id).first()
    if db_personal_data:
        # update data
        db_personal_data.nama = personal_data.nama
        # db_personal_data.foto_ktp = personal_data.foto_ktp
        # db_personal_data.foto_npwp = personal_data.foto_npwp
        # db_personal_data.ttd = personal_data.ttd
        db_personal_data.tempat_lahir = personal_data.tempat_lahir
        db_personal_data.tgl_lahir = personal_data.tgl_lahir
        db_personal_data.jenis_kelamin = personal_data.jenis_kelamin
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.agama = personal_data.agama
        db_personal_data.status_perkawinan = personal_data.status_perkawinan
        db_personal_data.pend_terakhir = personal_data.pend_terakhir
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.status_kewarganegaraan = personal_data.status_kewarganegaraan
        db_personal_data.nomor_npwp = personal_data.nomor_npwp
        db_personal_data.pemilik_npwp = personal_data.pemilik_npwp
        session.commit()
        session.refresh(db_personal_data)
        return db_personal_data
    return {"message": "User not found"}

# GET PERSONAL DATA BY ID (page profile_page, informasi_akun)


@app.get("/getPersonalData/{user_id}")
def get_personal_data_by_user_id(user_id: int, session: Session = Depends(get_session)):
    personal_data = session.query(
        models.PersonalDataModel).filter_by(user_id=user_id).first()
    if personal_data is None:
        return {"error": "Personal data not found"}
    return {"personal_data": personal_data}

# ==================================== BANK =================================================

# ADD DATA BANK (page tambah_rekening, akun_bank)


@app.post("/addBank/{user_id}")
def add_bank(bank_data: schemas.BankSchema, user_id: int, session=Depends(get_session)):
    bank = models.BankModel(
        user_id=user_id,
        nama_bank=bank_data.nama_bank,
        nomor_rekening=bank_data.nomor_rekening,
        nama_pemilik_bank=bank_data.nama_pemilik_bank
    )
    session.add(bank)
    session.commit()
    session.refresh(bank)
    return {"bank": bank}

# GET BANK BY USER_ID (page tarik_dana, bankAndCards)


@app.get("/getBank/{user_id}")
def get_user_banks(user_id: int, session=Depends(get_session)):
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    return {"bank_user": user.banks}

# ==================================== WALLET =================================================
# GET WALLET BY USER ID (page wallet)


@app.get("/users/{user_id}/wallet")
def get_user_wallet(user_id: int, session=Depends(get_session)):
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    return {"wallet_user": user.wallet}

# ==================================== RIWAYAT SALDO =================================================
# GET RIWAYAT WALLET BY USER ID (page wallet)


@app.get("/users/{user_id}/riwayat-saldo")
def get_riwayat_saldo_by_user_id(user_id: int, session=Depends(get_session)):
    wallet = session.query(models.WalletModel).filter_by(
        user_id=user_id).first()
    if wallet is None:
        return {"error": "Wallet not found"}

    riwayat_saldo = session.query(models.RiwayatSaldoModel).filter_by(
        wallet_id=wallet.wallet_id).all()
    return {"riwayat_saldo": wallet.riwayat_saldo}

# ==================================== UMKM =================================================
# UPDATE DATA UMKM (page data_identitas_usaha)


@app.put("/updateUMKM/{user_id}")
def update_umkm(user_id: int, umkm_data: schemas.UMKMSchema, session=Depends(get_session)):
    pemilik_umkm = session.query(
        models.PemilikUmkmModel).filter_by(user_id=user_id).first()
    umkm = session.query(models.UMKMModel).filter_by(
        pemilik_id=pemilik_umkm.pemilik_id).first()
    if umkm:
        umkm.pemilik_id = pemilik_umkm.pemilik_id
        umkm.bentuk_umkm = umkm_data.bentuk_umkm
        umkm.nama_umkm = umkm_data.nama_umkm
        umkm.alamat_umkm = umkm_data.alamat_umkm
        umkm.kategori_umkm = umkm_data.kategori_umkm
        umkm.deskripsi_umkm = umkm_data.deskripsi_umkm
        umkm.kontak_umkm = umkm_data.kontak_umkm
        umkm.jumlah_karyawan = umkm_data.jumlah_karyawan
        umkm.omset_bulanan = umkm_data.omset_bulanan
        umkm.foto_umkm = umkm_data.foto_umkm
        session.commit()
        session.refresh(umkm)
        return {"umkm": umkm}
    return {"message": "Pemilik UMKM is not found", 'umkm': umkm}

# GET UMKM BY user_id (Page identitas_usaha, rincian_umkm, rincian_portofolio)


@app.get("/getUmkm/{user_id}")
def get_umkm_by_user_id(user_id: int, session=Depends(get_session)):
    # get user
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    # get pemilik umkm
    pemilik_umkm = session.query(
        models.PemilikUmkmModel).filter_by(user_id=user_id).first()
    if pemilik_umkm is None:
        return {"error": "Pemilik UMKM is not found"}
    # get umkm
    umkm = session.query(models.UMKMModel).filter_by(
        pemilik_id=pemilik_umkm.pemilik_id).first()
    if umkm is None:
        return {"error": "UMKM is not found"}
    return {"umkm": umkm}

# GET UMKM BY PINJAMAN ID


@app.get("/getUmkmByPinjaman/{pinjaman_id}")
def get_umkm_by_pinjaman_id(pinjaman_id: int, session=Depends(get_session)):
    # pinjaman
    pinjaman = session.query(models.PinjamanModel).get(pinjaman_id)
    if pinjaman is None:
        return {"error": "Pinjaman is not found"}
    umkm = session.query(models.UMKMModel).filter_by(
        umkm_id=pinjaman.umkm_id).first()
    if umkm is None:
        return {"error": "UMKM is not found"}
    return {"umkm": umkm, "pinjaman": pinjaman}

# ADD PINJAMAN UMKM (page pengajuanPinjaman)


@app.post("/addPinjamanUmkm/{user_id}")
def add_pinjaman_umkm(user_id: int, pinjaman_umkm_data: schemas.PinjamanSchema, db=Depends(get_session)):
    # cari user
    user = db.query(models.UserModel).filter_by(user_id=user_id).first()
    if user is None:
        return {"error": "User not found"}
    # cari pemilik umkm
    pemilik_umkm = db.query(models.PemilikUmkmModel).filter_by(
        user_id=user_id).first()
    if pemilik_umkm is None:
        return {"error": "Pemilik UMKM is not found"}
    # cari umkm
    umkm = db.query(models.UMKMModel).filter_by(
        pemilik_id=pemilik_umkm.pemilik_id).first()
    if umkm is None:
        return {"message": "UMKM not found"}

    current_date = datetime.now().date()
    tgl_tenggang = current_date + timedelta(days=30)

    pinjaman = models.PinjamanModel(
        umkm_id=umkm.umkm_id,
        jumlah_pinjaman=pinjaman_umkm_data.jumlah_pinjaman,
        tenor_pinjaman=pinjaman_umkm_data.tenor_pinjaman,
        bunga_pinjaman=pinjaman_umkm_data.bunga_pinjaman,
        frekuensi_angsuran_pokok=pinjaman_umkm_data.frekuensi_angsuran_pokok,
        tgl_pengajuan=current_date,
        tgl_tenggang=tgl_tenggang,
        status_pinjaman=pinjaman_umkm_data.status_pinjaman,
        tujuan_pinjaman=pinjaman_umkm_data.tujuan_pinjaman,
        pinjaman_terkumpul=0
    )

    db.add(pinjaman)
    db.commit()
    db.refresh(pinjaman)
    return pinjaman

# ==================================== PINJAMAN =================================================

# GET PINJAMAN BY USER_ID (Page list_pinjaman) -> borrower


@app.get("/getPinjaman/{user_id}")
def get_pinjaman_by_user_id(user_id: int, session=Depends(get_session)):
    # get user
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    # get pemilik umkm
    pemilik_umkm = session.query(
        models.PemilikUmkmModel).filter_by(user_id=user_id).first()
    if pemilik_umkm is None:
        return {"error": "Pemilik UMKM is not found"}
    # cari umkm
    umkm = session.query(models.UMKMModel).filter_by(
        pemilik_id=pemilik_umkm.pemilik_id).first()
    if umkm is None:
        return {"message": "UMKM not found"}

    # cari pinjaman berdasarkan umkm_id
    umkm_id = umkm.umkm_id
    pinjaman = session.query(models.PinjamanModel).filter_by(
        umkm_id=umkm_id).all()
    if pinjaman is None:
        return {"message": "Pinjaman not found"}
    # dashboard umkm
    pinjamanPending = session.query(models.PinjamanModel).filter_by(
        umkm_id=umkm_id).filter_by(status_pinjaman="Pending").all()
    if pinjamanPending is None:
        return {"message": "Pinjaman not found"}
    # list pinjaman selesai / lunas
    pinjamanLunas = session.query(models.PinjamanModel).filter_by(
        umkm_id=umkm_id).filter_by(status_pinjaman="Lunas").all()
    if pinjamanLunas is None:
        return {"message": "Pinjaman not found"}
    # list pinjaman open
    pinjamanOpen = session.query(models.PinjamanModel).filter_by(
        umkm_id=umkm_id).filter_by(status_pinjaman="Open").all()
    if pinjamanOpen is None:
        return {"message": "Pinjaman not found"}
    # pinjaman close
    pinjamanClose = session.query(models.PinjamanModel).filter_by(
        umkm_id=umkm_id).filter_by(status_pinjaman="Close").all()
    if pinjamanClose is None:
        return {"message": "Pinjaman not found"}
    return {"pinjaman": pinjaman, "pinjamanPending": pinjamanPending, "pinjamanLunas": pinjamanLunas, "pinjamanOpen": pinjamanOpen, "pinjamanClose": pinjamanClose}

# GET PINJAMAN ALL WHERE STATUS_PINJAMAN == OPEN (investor)


@app.get("/getOpenPinjaman")
def get_pinjaman_by_status(session=Depends(get_session)):
    pinjaman = session.query(models.PinjamanModel).filter_by(
        status_pinjaman="Open").all()
    if pinjaman is None:
        return {"message": "Pinjaman not found"}
    return {"pinjaman": pinjaman}

# UPDATE STATUS PINJAMAN


@app.put("/updateStatusPinjaman/{pinjaman_id}")
def update_status_pinjaman(pinjaman_id: int, session=Depends(get_session)):
    # get pinjaman by pinjaman_id
    pinjaman = session.query(models.PinjamanModel).filter_by(
        pinjaman_id=pinjaman_id).first()
    if pinjaman is None:
        return {"message": "Pinjaman not found"}
    if (pinjaman.status_pinjaman == "Close"):
        pinjaman.status_pinjaman = "Pending"
        session.commit()
        session.refresh(pinjaman)
        session.close()
    return {"pinjaman": pinjaman}

# ==================================== WALLET =================================================

# add saldo to riwayat wallet and update saldo wallet


@app.post("/addRiwayatWallet/{wallet_id}")
def add_riwayat_wallet(wallet_id: int, riwayat_wallet_data: schemas.RiwayatSaldoSchema, session=Depends(get_session)):
    # get wallet by wallet id
    wallet = session.query(models.WalletModel).filter_by(
        wallet_id=wallet_id).first()
    if (wallet is None):
        return {"message": "Wallet not found"}
    # add riwayat wallet to wallet
    riwayat_wallet = models.RiwayatSaldoModel(
        wallet_id=wallet_id,
        saldo_transaksi=riwayat_wallet_data.saldo_transaksi,
        keterangan=riwayat_wallet_data.keterangan,
        status_transaksi=riwayat_wallet_data.status_transaksi
    )
    session.add(riwayat_wallet)
    session.commit()
    session.refresh(riwayat_wallet)
    # update saldo wallet
    if (riwayat_wallet_data.status_transaksi == "Masuk"):
        wallet.saldo += Decimal(riwayat_wallet_data.saldo_transaksi)
    elif (riwayat_wallet_data.status_transaksi == "Keluar"):
        wallet.saldo -= Decimal(riwayat_wallet_data.saldo_transaksi)
    session.commit()
    session.refresh(wallet)
    session.close()
    return {"riwayat_wallet": riwayat_wallet, "wallet": wallet}

# get riwayat wallet by wallet id


@app.get("/getRiwayatWallet/{wallet_id}")
def get_riwayat_wallet(wallet_id: int, session=Depends(get_session)):
    riwayat_wallet = session.query(models.RiwayatSaldoModel).filter_by(
        wallet_id=wallet_id).order_by(models.RiwayatSaldoModel.id_riwayat.desc()).all()
    if riwayat_wallet is None:
        return {"message": "Pinjaman not found"}
    return {"riwayat_wallet": riwayat_wallet}

# ==================================== PENDANAAN =================================================

# GET PENDANAAN BY USER_ID


@app.get("/getPendanaan/{user_id}")
def get_pendanaan_funder(user_id: int, session=Depends(get_session)):
    # get funder by user_id
    funder = session.query(models.PenyediaDanaModel).filter_by(
        user_id=user_id).first()
    if (funder is None):
        return {"message": "Funder not found"}
    # get all pendanaan by funder_id (portofolio page)
    pendanaan = session.query(models.PendanaanModel).filter_by(
        funder_id=funder.funder_id).all()
    # get lunas pendanaan by funder_id (portofolio page)
    pendanaanLunas = session.query(models.PendanaanModel).filter_by(
        funder_id=funder.funder_id).filter_by(status_pendanaan="Lunas").all()
    return {"pendanaan": pendanaan, "pendanaanLunas": pendanaanLunas}

# POST PENDANAAN BY USER_ID

# ===================================== UPLOAD FILE ======================

# PUT FILE IMAGE


@app.put("/uploadfile/{user_id}/KTP")
async def create_upload_file(user_id: int, file: UploadFile = File(...), session=Depends(get_session)):

    FILEPATH = "./percobaan_4/asset/images/"
    filename = file.filename
    # test.png => ["test", "png"]
    # Get the last element after splitting by "."
    extension = filename.split(".")[-1]
    valid_extensions = ["png", "jpg", "jpeg"]  # List of valid extensions

    if extension not in valid_extensions:
        return {"status": "error", "detail": "File extension not allowed"}

    # token_name = secrets.token_hex(10) + "."+extension
    generated_name = FILEPATH + filename
    file_content = await file.read()

    with open(generated_name, "wb") as file:
        file.write(file_content)

    # PILLOW
    img = Image.open(generated_name)
    img = img.resize(size=(500, 500))
    img.save(generated_name)

    # get user
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}

    personal = session.query(models.PersonalDataModel).filter_by(
        user_id=user_id).first()
    if personal is None:
        return {"error": "Personal Data is not found"}

    if personal:
        personal.foto_ktp = filename
        session.commit()
        session.refresh(personal)
        return {"ktp": personal}
    file.close()

# PUT FILE IMAGE


# @app.put("/uploadfile/{user_id}/TTD")
# async def create_upload_file(user_id: int, file: UploadFile = File(...), session=Depends(get_session)):

#     FILEPATH = "./percobaan_4/static/images/ttd/"
#     filename = file.filename
#     # test.png => ["test", "png"]
#     # Get the last element after splitting by "."
#     extension = filename.split(".")[-1]
#     valid_extensions = ["png", "jpg", "jpeg"]  # List of valid extensions

#     if extension not in valid_extensions:
#         return {"status": "error", "detail": "File extension not allowed"}

#     token_name = secrets.token_hex(10) + "."+extension
#     generated_name = FILEPATH + token_name
#     file_content = await file.read()

#     with open(generated_name, "wb") as file:
#         file.write(file_content)

#     # PILLOW
#     img = Image.open(generated_name)
#     img = img.resize(size=(500, 500))
#     img.save(generated_name)

#     # get user
#     user = session.query(models.UserModel).get(user_id)
#     if user is None:
#         return {"error": "User not found"}

#     personal = session.query(models.PersonalDataModel).filter_by(
#         user_id=user_id).first()
#     if personal is None:
#         return {"error": "Personal Data is not found"}

#     if personal:
#         personal.ttd = token_name
#         session.commit()
#         session.refresh(personal)
#         return {"ktp": personal}
#     file.close()

@app.put("/uploadfile/{user_id}/TTD")
async def create_upload_file(user_id: int, file: UploadFile = File(...), session=Depends(get_session)):

    FILEPATH = "./percobaan_4/asset/images/"
    filename = file.filename
    # test.png => ["test", "png"]
    # Get the last element after splitting by "."
    extension = filename.split(".")[-1]
    valid_extensions = ["png", "jpg", "jpeg"]  # List of valid extensions

    if extension not in valid_extensions:
        return {"status": "error", "detail": "File extension not allowed"}

    generated_name = FILEPATH + filename
    file_content = await file.read()

    with open(generated_name, "wb") as file:
        file.write(file_content)

    # PILLOW
    img = Image.open(generated_name)
    img = img.resize(size=(500, 500))
    img.save(generated_name)

    # get user
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}

    personal = session.query(models.PersonalDataModel).filter_by(
        user_id=user_id).first()
    if personal is None:
        return {"error": "Personal Data is not found"}

    if personal:
        personal.ttd = filename
        session.commit()
        session.refresh(personal)
        return {"ktp": personal}
    file.close()

# PUT FILE IMAGE


@app.put("/uploadfile/{user_id}/NPWP")
async def create_upload_file(user_id: int, file: UploadFile = File(...), session=Depends(get_session)):

    FILEPATH = "./percobaan_4/asset/images/"
    filename = file.filename
    # test.png => ["test", "png"]
    # Get the last element after splitting by "."
    extension = filename.split(".")[-1]
    valid_extensions = ["png", "jpg", "jpeg"]  # List of valid extensions

    if extension not in valid_extensions:
        return {"status": "error", "detail": "File extension not allowed"}

    # token_name = secrets.token_hex(10) + "."+extension
    generated_name = FILEPATH + filename
    file_content = await file.read()

    with open(generated_name, "wb") as file:
        file.write(file_content)

    # PILLOW
    img = Image.open(generated_name)
    img = img.resize(size=(500, 500))
    img.save(generated_name)

    # get user
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}

    personal = session.query(models.PersonalDataModel).filter_by(
        user_id=user_id).first()
    if personal is None:
        return {"error": "Personal Data is not found"}

    if personal:
        personal.foto_npwp = filename
        session.commit()
        session.refresh(personal)
        return {"ktp": personal}
    file.close()


@app.post("/addPendanaan/{user_id}")
def add_pendanaan(user_id: int, data_pendanaan: schemas.PendanaanSchema, session=Depends(get_session)):
    # get funder by user_id
    funder = session.query(models.PenyediaDanaModel).filter_by(
        user_id=user_id).first()
    if (funder is None):
        return {"message": "Funder not found"}

    # add pendanaan
    pendanaan = models.PendanaanModel(
        funder_id=funder.funder_id,
        pinjaman_id=data_pendanaan.pinjaman_id,
        jumlah_pendanaan=data_pendanaan.jumlah_pendanaan,
        status_pendanaan=data_pendanaan.status_pendanaan,
        total_pembayaran=data_pendanaan.total_pembayaran,
        curr_pembayaran=data_pendanaan.curr_pembayaran
    )
    session.add(pendanaan)
    session.commit()
    session.refresh(pendanaan)
    # update pinjaman_terkumpul dari pinjaman tersebut
    pinjaman_id = data_pendanaan.pinjaman_id
    # get pinjaman by pinjaman_id
    pinjaman = session.query(models.PinjamanModel).filter_by(
        pinjaman_id=pinjaman_id).first()
    if (pinjaman is None):
        return {"message": "Pinjaman not found"}
    # update dana pinjaman
    pinjaman.pinjaman_terkumpul += Decimal(data_pendanaan.jumlah_pendanaan)
    # update status pinjaman
    if (pinjaman.pinjaman_terkumpul == pinjaman.jumlah_pinjaman):
        pinjaman.status_pinjaman = "Close"
    session.commit()
    session.refresh(pinjaman)
    session.close()
    return {"pendanaan": pendanaan, "pinjaman": pinjaman}

# ambil image berdasarkan nama file


# ambil image berdasarkan nama file
@app.get("/getimage/{nama_file}")
async def getImage(nama_file: str):
    return FileResponse("./percobaan_4/asset/images/"+nama_file)
