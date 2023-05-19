import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 400,
                  height: 350,
                  /*decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('asset/images/logo-daus-saja.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(color: Colors.white), // Set text color
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.white), // Set label text color
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                  hintText: 'Enter valid email id as abc@gmail.com',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                style: TextStyle(color: Colors.white), // Set text color
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: Colors.white), // Set label text color
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Set border color when focused
                  ),
                  hintText: 'Enter Strong',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Forgot password screen
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            // Button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(151, 126, 242, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            // Button

            SizedBox(
              height: 50,
            ),
            Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}
