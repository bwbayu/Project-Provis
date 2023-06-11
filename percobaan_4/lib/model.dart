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

  // ADD DATA REGISTER
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