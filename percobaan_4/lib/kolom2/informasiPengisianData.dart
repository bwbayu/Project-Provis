import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class formData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple[200]!,
          automaticallyImplyLeading: true,
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
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.of(context).size.height,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 10, 10, 0),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Mulai Pengisian Data',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFFF7F8F9),
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text(
                          'Sebelum melanjutkan pengisian data, mohon siapkan dokumen berikut untuk memudahkan pengisian data Anda.',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFF2F5F8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Button pressed callback
                        Navigator.pushNamed(context, '/formKTP');
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
                          'KTP',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Button pressed callback
                        Navigator.pushNamed(context, '/formNPWP');
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
                          'NPWP (opsional)',
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
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 20, 10, 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Lanjutkan',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF977EF2),
                              textStyle: TextStyle(fontSize: 16),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
