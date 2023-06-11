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

  // POST VERIFIKASI DATA
  

}