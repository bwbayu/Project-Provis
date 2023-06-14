import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends ChangeNotifier{
  String _password = "";
  String _email = "";
  String _nomorhp = "";
  String _jenis_user = "";

  // GETTER SETTER
  String get password => _password;
  String get email => _email;
  String get nomorhp => _nomorhp;
  String get jenis_user => _jenis_user;

  set password(String value) { 
    _password = value;
    notifyListeners(); 
  }
  set email(String value) { 
    _email = value;
    notifyListeners(); 
  }
  set nomorhp(String value) { 
    _nomorhp = value;
    notifyListeners(); 
  }
  set jenis_user(String value) { 
    _jenis_user = value;
    notifyListeners(); 
  }

  // POST REGISTER DATA

  late Future<int> respPost;
  bool isLoading = false;

  Register() {
    respPost = Future.value(0);
    isLoading = false;
  }

  Future<int> addUser() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('http://127.0.0.1:8000/addUser');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': email,
      'password': password,
      'c_password': password,
      'email': email,
      'nomor_hp': nomorhp,
      'jenis_user': jenis_user,
      'status_akun': "Not Verified",
    });

    final response = await http.post(url, headers: headers, body: body);
    isLoading = false;
    notifyListeners();
    return response.statusCode;
  }
}

class Login extends ChangeNotifier{
  String _email= "";
  String _password = "";
  int _user_id = 0;
  String _jenis_user = "";
  

  // SETTER GETTER
  String get email => _email;
  String get password => _password;
  int get user_id => _user_id;
  String get jenis_user => _jenis_user;
  set email(String value) { 
    _email = value;
    notifyListeners(); 
  }
  set password(String value) { 
    _password = value;
    notifyListeners(); 
  }
  set user_id(int value) { 
      _user_id = value;
      notifyListeners(); 
    }
  set jenis_user(String value) {
    _jenis_user = value;
    notifyListeners();
  }

  // POST LOGIN DATA
  late Future<int> respPost;
  bool isLoading = false;

  Login() {
    respPost = Future.value(0);
    isLoading = false;
  }

  Future<int> loginProcess() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('http://127.0.0.1:8000/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(url, headers: headers, body: body);
    final responseData = jsonDecode(response.body);
    isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      user_id = responseData['user_id'];
      jenis_user = responseData['jenis_user'];
    }
    return response.statusCode;
  }

  void reset(){
    email = "";
    password = "";
    user_id = 0;
    jenis_user = "";
  }
}

class VerifikasiAkun extends ChangeNotifier{
  String _nama = "";
  String _tempat_lahir = "";
  String _tgl_lahir = "";
  String _jenis_kelamin = "";
  String _agama = "";
  String _status_perkawinan = "";
  String _pend_terakhir = "";
  String _alamat = "";
  String _status_kewarganegaraan = "";
  String _provinsi = "";
  String _kota = "";
  String _kecamatan = "";
  String _kelurahan = "";
  String _rtrw = "";
  String _kodepos = "";
  String _foto_ktp = "";
  String _foto_npwp = "";
  String _ttd = "";
  String _nomor_npwp = "";
  String _pemilik_npwp = "";

  // SETTER GETTER
  String get nama => _nama;
  String get tempat_lahir => _tempat_lahir;
  String get tgl_lahir => _tgl_lahir;
  String get jenis_kelamin => _jenis_kelamin;
  String get agama => _agama;
  String get status_perkawinan => _status_perkawinan;
  String get pend_terakhir => _pend_terakhir;
  String get alamat => _alamat;
  String get status_kewarganegaraan => _status_kewarganegaraan;
  String get foto_ktp => _foto_ktp;
  String get foto_npwp => _foto_npwp;
  String get ttd => _ttd;
  String get nomor_npwp => _nomor_npwp;
  String get pemilik_npwp => _pemilik_npwp;

  set nama(String value){
    _nama = value;
    notifyListeners();
  }

  set tempat_lahir(String value){
    _tempat_lahir = value;
    notifyListeners();
  }
  set tgl_lahir(String value){
    _tgl_lahir = value;
    notifyListeners();
  }
  set jenis_kelamin(String value){
    _jenis_kelamin = value;
    notifyListeners();
  }
  set agama(String value){
    _agama = value;
    notifyListeners();
  }
  set status_perkawinan(String value){
    _status_perkawinan = value;
    notifyListeners();
  }
  set pend_terakhir(String value){
    _pend_terakhir = value;
    notifyListeners();
  }
  set alamat(String value){
    _alamat = value;
    notifyListeners();
  }
  set status_kewarganegaraan(String value){
    _status_kewarganegaraan = value;
    notifyListeners();
  }
  set provinsi(String value){
    _provinsi = value;
    notifyListeners();
  }
  set kota(String value){
    _kota = value;
    notifyListeners();
  }
  set kecamatan(String value){
    _kecamatan = value;
    notifyListeners();
  }
  set kelurahan(String value){
    _kelurahan = value;
    notifyListeners();
  }
  set rtrw(String value){
    _rtrw = value;
    notifyListeners();
  }
  set kodepos(String value){
    _kodepos = value;
    notifyListeners();
  }
  set nomor_npwp(String value){
    _nomor_npwp = value;
    notifyListeners();
  }
  set pemilik_npwp(String value){
    _pemilik_npwp = value;
    notifyListeners();
  }

  // PUT VERIFIKASI DATA
  late Future<int> respPost;
  Future<int> VerifyProcess(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/updatePersonalData/' + user_id.toString());
    final headers = {'Content-Type': 'application/json'};
    final alamatValue = alamat.isNotEmpty ? '$alamat, $_provinsi, $_kota, $_kecamatan, $_kelurahan, $_rtrw, $_kodepos' : '';
    final body = jsonEncode({
      'id_user': user_id,
      'foto_ktp': "foto_ktp",
      'foto_npwp': "foto_npwp",
      "ttd": "ttd",
      "nama": nama,
      "tempat_lahir": tempat_lahir,
      "tgl_lahir": tgl_lahir,
      "jenis_kelamin": jenis_kelamin,
      "agama": agama,
      "status_perkawinan": status_perkawinan,
      "pend_terakhir": pend_terakhir,
      "alamat": alamatValue,
      "status_kewarganegaraan": status_kewarganegaraan,
      "nomor_npwp": nomor_npwp,
      "pemilik_npwp": pemilik_npwp,
    });

    try {
      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return response.statusCode;
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
        return response.statusCode;
      } else {
        print('Error: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Exception: $e');
      return 0;
    }
  }

  // UPDATE STATUS AKUN
  Future<int> updateUser(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/updateStatusAkun/' + user_id.toString());
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.put(url, headers: headers);

      if (response.statusCode == 200) {
        return response.statusCode;
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
        return response.statusCode;
      } else {
        print('Error: ${response.statusCode}');
        return response.statusCode;
      }
    } catch (e) {
      print('Exception: $e');
      return 0;
    }
  }

  String _status_akun = "";
  String get status_akun => _status_akun;
  // map dari json ke atribut
  void setFromJson(Map<String, dynamic> json){
    _status_akun = json['user']['status_akun'];
    notifyListeners();
  }

  // ambil data dari api secara async
  Future<void> fetchStatusAkun(int user_id) async{
    final response = await http.get(Uri.parse("http://127.0.0.1:8000/getUserById/"+user_id.toString()));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setFromJson(data);
      } else {
        throw Exception('Failed to fetch user data');
      }
  }

  void reset(){
    nama = "";
    tempat_lahir = "";
    tgl_lahir = "";
    jenis_kelamin = "";
    agama = "";
    status_perkawinan = "";
    pend_terakhir = "";
    alamat = "";
    status_kewarganegaraan = "";
    provinsi = "";
    kota = "";
    kecamatan = "";
    kelurahan = "";
    rtrw = "";
    kodepos = "";
    nomor_npwp = "";
    pemilik_npwp = "";
  }
}

class Wallet extends ChangeNotifier{
  double saldo;
  int wallet_id;

  Wallet({required this.saldo, required this.wallet_id});

  // map dari json ke atribut
  void setFromJson(Map<String, dynamic> json){
    saldo = json['wallet_user']['saldo'];
    wallet_id = json['wallet_user']['wallet_id'];
    notifyListeners();
  }

  // ambil data dari api secara async
  Future<void> fetchData(int user_id) async{
    final response = await http.get(Uri.parse("http://127.0.0.1:8000/users/$user_id/wallet"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setFromJson(data);
      } else {
        throw Exception('Failed to fetch user wallet');
      }
  }

}

class ProfileData extends ChangeNotifier{
  String nama = "";
  String tempat_lahir = "";
  String tgl_lahir = "";
  String jenis_kelamin = "";
  String agama = "";
  String status_perkawinan = "";
  String pend_terakhir = "";
  String alamat = "";
  String status_kewarganegaraan = "";
  String provinsi = "";
  String kabkota = "";
  String kecamatan = "";
  String kelurahan = "";
  String rtrw = "";
  String kodepos = "";


  // map dari json ke atribut
  void setFromJson(Map<String, dynamic> json){
    nama = json['personal_data']['nama'];
    tempat_lahir = json['personal_data']['tempat_lahir'];
    tgl_lahir = json['personal_data']['tgl_lahir'];
    jenis_kelamin = json['personal_data']['jenis_kelamin'];
    agama = json['personal_data']['agama'];
    status_perkawinan = json['personal_data']['status_perkawinan'];
    pend_terakhir = json['personal_data']['pend_terakhir'];
    alamat = json['personal_data']['alamat'];
    // Splitting the alamat into separate variables
    if(alamat != ""){
      final alamatParts = alamat.split(', ');
      if (alamatParts.length >= 6) {
        alamat = alamatParts[0];
        provinsi = alamatParts[1];
        kabkota = alamatParts[2];
        kecamatan = alamatParts[3];
        kelurahan = alamatParts[4];
        rtrw = alamatParts[5];
        kodepos = alamatParts[6];
      }
    }
    status_kewarganegaraan = json['personal_data']['status_kewarganegaraan'];
    notifyListeners();
  }

  // ambil data dari api secara async
  Future<void> fetchData(int user_id) async{
    final response = await http.get(Uri.parse("http://127.0.0.1:8000/getPersonalData/"+user_id.toString()));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setFromJson(data);
      } else {
        throw Exception('Failed to fetch user wallet');
      }
  }
}

class BankData extends ChangeNotifier{
  String _nama_bank = "";
  String _nomor_rekening = "";
  String _nama_pemilik_bank = "";

  String get nama_bank => _nama_bank; 
  String get nomor_rekening => _nomor_rekening; 
  String get nama_pemilik_bank => _nama_pemilik_bank;

  set nama_bank(String value){
    _nama_bank = value;
    notifyListeners();
  }
  set nomor_rekening(String value) { 
    _nomor_rekening = value;
    notifyListeners(); 
  }
  set nama_pemilik_bank(String value) { 
    _nama_pemilik_bank = value;
    notifyListeners(); 
  }

  // ADD DATA BANK
  Future<int> addBankData(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/addBank/$user_id');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'user_id': user_id,
      'nama_bank': nama_bank,
      'nomor_rekening': nomor_rekening,
      'nama_pemilik_bank': nama_pemilik_bank,
    });

    final response = await http.post(url, headers: headers, body: body);
    return response.statusCode;
  }

  void reset(){
    nama_bank = "";
    nomor_rekening = "";
    nama_pemilik_bank = "";
  }
}

// GET BANK USER
class DataBank{
  int bank_id;
  String nama_bank;
  String nomor_rekening;
  String nama_pemilik_bank;
  // constructor
  DataBank({required this.bank_id, required this.nama_bank, required this.nomor_rekening, required this.nama_pemilik_bank});
}

class Bank{
  List<DataBank> listBank = <DataBank>[];

  Bank(Map<String, dynamic> json){
    var data = json['bank_user'];
    for(var val in data){
      var bank_id = val['bank_id'];
      var nama_bank = val['nama_bank'];
      var nomor_rekening = val['nomor_rekening'];
      var nama_pemilik_bank = val['nama_pemilik_bank'];
      listBank.add(DataBank(bank_id: bank_id, nama_bank: nama_bank, nomor_rekening: nomor_rekening, nama_pemilik_bank: nama_pemilik_bank));
    }
  }

  factory Bank.fromJson(Map<String, dynamic> json){
    return Bank(json);
  }
}

class BankUser with ChangeNotifier{
  Bank? bank;
  bool isLoading = false;

  Future<int> fetchDataBank(int user_id) async{
    isLoading = true;
    notifyListeners();

    try{
      String url = "http://127.0.0.1:8000/getBank/$user_id";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        bank = Bank.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
      isLoading = false;
      notifyListeners();
      return response.statusCode;
    }catch(e){
      print('Exception: $e');
      isLoading = false;
      notifyListeners();
      return 0;
    }
  }
}

// MENAMPILKAN LIST BANK DI ISI SALDO
class OurBankData {
  String namaBank;
  String iconBank;

  OurBankData({required this.namaBank, required this.iconBank});
}

class OurBank with ChangeNotifier {
  List<OurBankData> _bankList = [
    OurBankData(namaBank: 'BRI', iconBank: 'logo-daus-saja.png'),
    OurBankData(namaBank: 'BNI', iconBank: 'logo-daus-saja.png'),
    OurBankData(namaBank: 'BCA', iconBank: 'logo-daus-saja.png'),
    OurBankData(namaBank: 'Mandiri', iconBank: 'logo-daus-saja.png'),
  ];

  List<OurBankData> get bankList => _bankList;
}

class UmkmProvider extends ChangeNotifier {
  String _bentuk_umkm = '';
  String _nama_umkm = '';
  String _alamat_umkm = '';
  String _kategori_umkm = '';
  String _deskripsi_umkm = '';
  String _kontak_umkm = '';
  int _jumlah_karyawan = 0;
  double _omset_bulanan = 0.0;
  String _foto_umkm = '';

  String get bentuk_umkm => _bentuk_umkm;
  String get nama_umkm => _nama_umkm;
  String get alamat_umkm => _alamat_umkm;
  String get kategori_umkm => _kategori_umkm;
  String get deskripsi_umkm => _deskripsi_umkm;
  String get kontak_umkm => _kontak_umkm;
  int get jumlah_karyawan => _jumlah_karyawan;
  double get omset_bulanan => _omset_bulanan;
  String get foto_umkm => _foto_umkm;

  set bentuk_umkm(String value) {
    _bentuk_umkm = value;
    notifyListeners();
  }

  set nama_umkm(String value) {
    _nama_umkm = value;
    notifyListeners();
  }

  set alamat_umkm(String value) {
    _alamat_umkm = value;
    notifyListeners();
  }

  set kategori_umkm(String value) {
    _kategori_umkm = value;
    notifyListeners();
  }

  set deskripsi_umkm(String value) {
    _deskripsi_umkm = value;
    notifyListeners();
  }

  set kontak_umkm(String value) {
    _kontak_umkm = value;
    notifyListeners();
  }

  set jumlah_karyawan(int value) {
    _jumlah_karyawan = value;
    notifyListeners();
  }

  set omset_bulanan(double value) {
    _omset_bulanan = value;
    notifyListeners();
  }

  set foto_umkm(String value) {
    _foto_umkm = value;
    notifyListeners();
  }

  // POST DATA UMKM
  Future<int> updateUMKM(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/updateUMKM/$user_id');
    final headers = {'Content-Type': 'application/json'};
    final umkmData = {
      'pemilik_id': 0,
      'bentuk_umkm': bentuk_umkm,
      'jumlah_karyawan': jumlah_karyawan,
      'kontak_umkm': kontak_umkm,
      'kategori_umkm': kategori_umkm,
      'omset_bulanan': omset_bulanan,
      'nama_umkm': nama_umkm,
      'alamat_umkm': alamat_umkm,
      'deskripsi_umkm': deskripsi_umkm,
      'foto_umkm': "foto_umkm"
    };
    final body = jsonEncode(umkmData);
    final response = await http.put(url, headers: headers, body: body);
    
    return response.statusCode;
  }

  // RESET DATA UMKM
  void reset(){
    bentuk_umkm = '';
    nama_umkm = '';
    alamat_umkm = '';
    kategori_umkm = '';
    deskripsi_umkm = '';
    kontak_umkm = '';
    jumlah_karyawan = 0;
    omset_bulanan = 0.0;
  }
}

class PinjamanProvider extends ChangeNotifier {
  String _tenor_pinjaman = '';
  String _bunga_pinjaman = '';
  String _frekuensi_angsuran = '';
  String _status_pinjaman = '';
  String _tujuan_pinjaman = '';
  double _jumlah_pinjaman = 0.0;
  double _pinjaman_terkumpul = 0.0;

  String get tenor_pinjaman => _tenor_pinjaman;
  String get bunga_pinjaman => _bunga_pinjaman;
  String get frekuensi_angsuran => _frekuensi_angsuran;
  String get status_pinjaman => _status_pinjaman;
  String get tujuan_pinjaman => _tujuan_pinjaman;
  double get jumlah_pinjaman => _jumlah_pinjaman;
  double get pinjaman_terkumpul => _pinjaman_terkumpul;

  set tenor_pinjaman(String value) {
    _tenor_pinjaman = value;
    notifyListeners();
  }

  set bunga_pinjaman(String value) {
    _bunga_pinjaman = value;
    notifyListeners();
  }

  set frekuensi_angsuran(String value) {
    _frekuensi_angsuran = value;
    notifyListeners();
  }

  set status_pinjaman(String value) {
    _status_pinjaman = value;
    notifyListeners();
  }

  set tujuan_pinjaman(String value) {
    _tujuan_pinjaman = value;
    notifyListeners();
  }

  set jumlah_pinjaman(double value) {
    _jumlah_pinjaman = value;
    notifyListeners();
  }

  set pinjaman_terkumpul(double value) {
    _pinjaman_terkumpul = value;
    notifyListeners();
  }

  Future<int> addPinjamanUmkm(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/addPinjamanUmkm/$user_id');
    final headers = {'Content-Type': 'application/json'};
    final pinjamanData = {
      "umkm_id": 0,
      "jumlah_pinjaman": jumlah_pinjaman,
      "tenor_pinjaman": tenor_pinjaman,
      "bunga_pinjaman": bunga_pinjaman,
      "frekuensi_angsuran_pokok": frekuensi_angsuran,
      "status_pinjaman": "Open",
      "tujuan_pinjaman": tujuan_pinjaman,
      "pinjaman_terkumpul": 0
    };
    final body = jsonEncode(pinjamanData);

    final response = await http.post(url, headers: headers, body: body);
    
    return response.statusCode;
  }

  void reset(){
    tenor_pinjaman = '';
    bunga_pinjaman = '';
    frekuensi_angsuran = '';
    status_pinjaman = '';
    tujuan_pinjaman = '';
    jumlah_pinjaman = 0.0;
    pinjaman_terkumpul = 0.0;
  }
}

// GET PINJAMAN
class Pinjaman {
  int pinjaman_id;
  String tenor_pinjaman;
  String frekuensi_angsuran_pokok;
  String tgl_tenggang;
  String tujuan_pinjaman;
  int umkm_id;
  double jumlah_pinjaman;
  String bunga_pinjaman;
  String tgl_pengajuan;
  String status_pinjaman;
  double pinjaman_terkumpul;
  int? bungaPinjaman;
  int? tenor;
  int? frekuensiAngsuran;

  Pinjaman({
    required this.pinjaman_id,
    required this.tenor_pinjaman,
    required this.frekuensi_angsuran_pokok,
    required this.tgl_tenggang,
    required this.tujuan_pinjaman,
    required this.umkm_id,
    required this.jumlah_pinjaman,
    required this.bunga_pinjaman,
    required this.tgl_pengajuan,
    required this.status_pinjaman,
    required this.pinjaman_terkumpul,
  });

  factory Pinjaman.fromJson(Map<String, dynamic> json) {
    return Pinjaman(
      pinjaman_id: json['pinjaman_id'],
      tenor_pinjaman: json['tenor_pinjaman'],
      frekuensi_angsuran_pokok: json['frekuensi_angsuran_pokok'],
      tgl_tenggang: json['tgl_tenggang'],
      tujuan_pinjaman: json['tujuan_pinjaman'],
      umkm_id: json['umkm_id'],
      jumlah_pinjaman: json['jumlah_pinjaman'],
      bunga_pinjaman: json['bunga_pinjaman'],
      tgl_pengajuan: json['tgl_pengajuan'],
      status_pinjaman: json['status_pinjaman'],
      pinjaman_terkumpul: json['pinjaman_terkumpul'],
    );
  }
}

class PinjamanUser with ChangeNotifier {
  // FETCH DATA PINJAMAN UNTUK USER UMKM
  List<Pinjaman>? pinjamanList;
  bool isLoading = false;

  Future<int> fetchDataPinjaman(int user_id) async {
    isLoading = true;
    notifyListeners();

    try {
      String url = "http://127.0.0.1:8000/getPinjaman/$user_id";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var pinjamanData = data['pinjaman'];

        if (pinjamanData != null) {
          pinjamanList = List<Pinjaman>.from(
            pinjamanData.map((json) => Pinjaman.fromJson(json)),
          );
          calculateTotalPinjaman();
        } else {
          pinjamanList = [];
        }
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }

      isLoading = false;
      notifyListeners();
      return response.statusCode;
    } catch (e) {
      print('Exception: $e');
      isLoading = false;
      notifyListeners();
      return 0;
    }
  }
  
  // mencari total pinjaman
  double _total_pinjaman = 0.0;
  double get total_pinjaman => _total_pinjaman;
  void calculateTotalPinjaman() {
    _total_pinjaman = 0.0;
    if (pinjamanList != null) {
      for (var pinjaman in pinjamanList!) {
        _total_pinjaman += pinjaman.jumlah_pinjaman;
        // extract value bunga pinjaman
        String bungaPercentage = pinjaman.bunga_pinjaman.replaceAll('%', '');
        pinjaman.bungaPinjaman = int.parse(bungaPercentage);
        // extract value frekuensi angsuran pinjaman
        pinjaman.tenor = int.tryParse(pinjaman.tenor_pinjaman.split(' ')[0]) ?? 0;
        // extract value of frekuensi angsuran
        if(pinjaman.frekuensi_angsuran_pokok == "per bulan"){
          pinjaman.frekuensiAngsuran = pinjaman.tenor;
        }else{
          pinjaman.frekuensiAngsuran = 1;
        }
      }
    }
  }

  // FETCH DATA PINJAMAN YANG STATUSNYA OPEN UNTUK INVESTOR
  List<Pinjaman>? listPinjamanOpen;
  bool isLoading1 = false;

  Future<int> fetchDataPinjamanOpen() async {
    isLoading1 = true;
    notifyListeners();

    try {
      String url = "http://127.0.0.1:8000/getOpenPinjaman";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var pinjamanData = data['pinjaman'];

        if (pinjamanData != null) {
          listPinjamanOpen = List<Pinjaman>.from(
            pinjamanData.map((json) => Pinjaman.fromJson(json)),
          );
        } else {
          listPinjamanOpen = [];
        }
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }

      isLoading1 = false;
      notifyListeners();
      return response.statusCode;
    } catch (e) {
      print('Exception: $e');
      isLoading1 = false;
      notifyListeners();
      return 0;
    }
  }

  // FETCH DATA UMKM DARI PINJAMAN
  UmkmProvider dataUMKM = UmkmProvider(); //menampung data umkm

  // map dari json ke atribut
  void setFromJson(Map<String, dynamic> json){
    dataUMKM.bentuk_umkm = json['umkm']['bentuk_umkm'];
    dataUMKM.nama_umkm = json['umkm']['nama_umkm'];
    dataUMKM.alamat_umkm = json['umkm']['alamat_umkm'];
    dataUMKM.kategori_umkm = json['umkm']['kategori_umkm'];
    dataUMKM.deskripsi_umkm = json['umkm']['deskripsi_umkm'];
    dataUMKM.kontak_umkm = json['umkm']['kontak_umkm'];
    dataUMKM.jumlah_karyawan = json['umkm']['jumlah_karyawan'];
    dataUMKM.omset_bulanan = json['umkm']['omset_bulanan'];
    dataUMKM.foto_umkm = json['umkm']['foto_umkm'];
    notifyListeners();
  }

  bool isLoading2 = true;
  Future<int> fetchDataUmkm(int pinjaman_id) async {
    isLoading2 = true;
    notifyListeners();

    try {
      String url = "http://127.0.0.1:8000/getUmkmByPinjaman/$pinjaman_id";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('umkm')) {
          setFromJson(data);
        } else {
          // Handle case when 'umkm' is not found in the response body
          print('UMKM data not found in response');
        }
      } else if (response.statusCode == 422) {
        print('Validation Error: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }

      isLoading2 = false;
      notifyListeners();
      return response.statusCode;
    } catch (e) {
      print('Exception: $e');
      isLoading2 = false;
      notifyListeners();
      return 0;
    }
  }
}