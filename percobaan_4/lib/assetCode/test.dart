import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController jenisUserController = TextEditingController();

  Future<void> addUser() async {
    final url = Uri.parse('http://127.0.0.1:8000/addUser');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': usernameController.text,
      'password': passwordController.text,
      'c_password': cPasswordController.text,
      'email': emailController.text,
      'nomor_hp': nomorHpController.text,
      'jenis_user': jenisUserController.text,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // User data added successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User data added successfully')),
      );
    } else {
      // Error adding user data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding user data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: cPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: nomorHpController,
              decoration: InputDecoration(labelText: 'Nomor HP'),
            ),
            TextField(
              controller: jenisUserController,
              decoration: InputDecoration(labelText: 'Jenis User'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addUser,
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );  
  }
}

void main() {
  runApp(MaterialApp(
    home: UserForm(),
  ));
}
