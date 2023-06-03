import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button pressed callback
                          Navigator.pushNamed(context, '/dataDiri');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.purple[200]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidIdCard,
                            size: 50,
                            color: Color(0xFFF7F8F9),
                          ),
                          title: Text(
                            'Data Diri',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFFF7F8F9),
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFF2F5F8),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button pressed callback
                          Navigator.pushNamed(context, '/formData');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.purple[200]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidIdCard,
                            size: 50,
                            color: Color(0xFFF7F8F9),
                          ),
                          title: Text(
                            'Dokumen',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFFF7F8F9),
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFF2F5F8),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button pressed callback
                          Navigator.pushNamed(context, '/akunBank');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.purple[200]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidIdCard,
                            size: 50,
                            color: Color(0xFFF7F8F9),
                          ),
                          title: Text(
                            'Akun Bank',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFFF7F8F9),
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFF2F5F8),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button pressed callback
                          Navigator.pushNamed(context, '/formTTD');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.purple[200]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.solidIdCard,
                            size: 50,
                            color: Color(0xFFF7F8F9),
                          ),
                          title: Text(
                            'Tanda Tangan',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFFF7F8F9),
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFF2F5F8),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
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
