import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Test
class RolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(
                  'asset/images/vector.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(height: 16),
              Image.asset(
                'asset/images/logo-daus-saja.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 10),
              Text(
                'DAUS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Step to a better future?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Tell me, who you are?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // REGISTER DENGAN JENIS_USER = INVESTOR
                      Navigator.pushNamed(context, '/registerPage');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 80),
                      backgroundColor: Color.fromARGB(255, 148, 227, 191),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text('Investor'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // REGISTER DENGAN JENIS_USER = BORROWER
                      Navigator.pushNamed(context, '/registerPage');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 80),
                      backgroundColor: Color.fromARGB(255, 252, 181, 143),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text('UMKM'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                // MASUK KE DASHBOARD INVESTOR SEBAGAI VISITOR (KALAU BIKIN)
                'Not now',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
