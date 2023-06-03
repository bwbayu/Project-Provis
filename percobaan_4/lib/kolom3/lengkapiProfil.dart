import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class formVerifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple[200]!,
              Colors.purple[800]!,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Lengkapi Profil',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Mohon lengkapi data dibawah ini',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Informasi Akun Kamu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dataDiri');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 4.0,
                          ),
                          SizedBox(width: 8.0),
                          Text('Data Diri',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formData');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 4.0,
                          ),
                          SizedBox(width: 8.0),
                          Text('Dokumen',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/akunBank');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 4.0,
                          ),
                          SizedBox(width: 8.0),
                          Text('Akun Bank',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formTTD');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 4.0,
                          ),
                          SizedBox(width: 8.0),
                          Text('Tanda tangan',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/dashboardInvestor');
                      Navigator.pushNamed(context, '/dashboardUMKM');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF977EF2),
                      textStyle: TextStyle(fontSize: 16),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
