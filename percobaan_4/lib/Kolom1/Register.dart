import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';
// import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "asset/images/background.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        'asset/images/vector.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    title: Text(''),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Consumer<Register>(
                      builder: (context, register, child) => 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tumbuhkan bisnis anda',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'dengan cepat tanpa risau!',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onChanged: (value){
                                register.email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No. Handphone',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onChanged: (value){
                                register.nomorhp = value;
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onChanged: (value){
                                register.password = value;
                              },
                            ),
                          ),
                          SizedBox(height: 32),
                          Center(
                            child: Text(
                              'atau daftar dengan',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  // Facebook button action
                                },
                                icon: Image.asset(
                                  'asset/images/facebook.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Google button action
                                },
                                icon: Image.asset(
                                  'asset/images/google.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () async {
                              // MASUK LOGIN PAGE
                              try {
                                final statusCode = await register.addUser();
                                // Registration successful, navigate to login page
                                if(statusCode == 200){
                                  Navigator.pushNamed(context, '/loginPage');
                                }
                              } catch (error) {
                                // Registration failed, display the error message using a Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Registration Error: ${error.toString()}'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 70),
                              backgroundColor: register.isLoading
                                  ? Colors.grey // Disabled button color when loading
                                  : Colors.white, // Set the desired button color here
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Consumer<Register>(
                              builder: (context, register, child) => register.isLoading
                              ? CircularProgressIndicator() // Show loading indicator
                              : Text(
                                  'Daftar ' + register.jenis_user,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 168, 81, 223),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
