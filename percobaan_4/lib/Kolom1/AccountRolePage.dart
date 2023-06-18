import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class RolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("asset/images/background.jpg"), // Background image
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Step to a better future',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 50),
                          Text(
                            'Tell me, who you are?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                width: 300,
                                height: 80,
                                child: Consumer<Register>(
                                  builder: (context, register, child) =>
                                      ElevatedButton(
                                    onPressed: () {
                                      // REGISTER WITH JENIS_USER = INVESTOR
                                      register.jenis_user = "Investor";
                                      Navigator.pushNamed(
                                          context, '/registerPage');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    child: Text('Investor',
                                        style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                1000, 168, 81, 223))),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 300,
                                height: 80,
                                child: Consumer<Register>(
                                  builder: (context, register, child) =>
                                      ElevatedButton(
                                    onPressed: () {
                                      // REGISTER WITH JENIS_USER = BORROWER
                                      register.jenis_user = "Borrower";
                                      Navigator.pushNamed(
                                          context, '/registerPage');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    child: Text('UMKM',
                                        style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                1000, 168, 81, 223))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            // GO TO INVESTOR DASHBOARD AS VISITOR (IF IMPLEMENTED)
                            'Not now',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
