import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends ChangeNotifier{
  // String _username = "";
  String _password = "";
  // String _cpassword = "";
  String _email = "";
  String _nomorhp = "";
  String _jenis_user = "";

  // GETTER SETTER
  // String get username => _username;
  String get password => _password;
  // String get cpassword => _cpassword;
  String get email => _email;
  String get nomorhp => _nomorhp;
  String get jenis_user => _jenis_user;
  // set username(String value) { 
  //   _username = value;
  //   notifyListeners(); 
  // }
  set password(String value) { 
    _password = value;
    notifyListeners(); 
  }
  // set cpassword(String value) { 
  //   _cpassword = value;
  //   notifyListeners(); 
  // }
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

  // PUT VERIFIKASI DATA
  late Future<int> respPost;
  Future<int> VerifyProcess(int user_id) async {
    final url = Uri.parse('http://127.0.0.1:8000/updatePersonalData/' + user_id.toString());
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'id_user': user_id,
      'foto_ktp': foto_ktp,
      'foto_npwp': foto_npwp,
      "ttd": ttd,
      "nama": nama,
      "tempat_lahir": tempat_lahir,
      "tgl_lahir": tgl_lahir,
      "jenis_kelamin": jenis_kelamin,
      "agama": agama,
      "status_perkawinan": status_perkawinan,
      "pend_terakhir": pend_terakhir,
      "alamat": '$alamat, $_provinsi, $_kota, $_kecamatan, $_kelurahan, $_rtrw, $_kodepos',
      "status_kewarganegaraan": status_kewarganegaraan,
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