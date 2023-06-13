import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class formVerifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
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
                          backgroundColor: Colors.purple[800]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.user,
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
                            'Informasi identitas lengkap yang akan digunakan dalam aplikasi',
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
                          backgroundColor: Colors.purple[800]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.file,
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
                            'Dokumen yang diperlukan adalah KTP dan NPWP (opsional)',
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
                          backgroundColor: Colors.purple[800]!,
                          padding: EdgeInsets.zero,
                        ),
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.signature,
                            size: 32,
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
                            'Tanda tangan digital diperlukan untuk konfirmasi persetujuan',
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
                  // Butuh penanda buat bedain umkm dan investor
                  // biar redirect ke dashboardnya masing-masing
                  child: Consumer3<Login, VerifikasiAkun, ProfileData>(
                    builder: (context, login, verif, profile, child) =>
                        ElevatedButton(
                      onPressed: () async {
                        // add data diri
                        final statusCode =
                            await verif.VerifyProcess(login.user_id);
                        if (statusCode == 200) {
                          // verify berhasil, update status akun
                          final statusCode1 =
                              await verif.updateUser(login.user_id);
                          print(statusCode1);
                          // fetch data status akun
                          await verif.fetchStatusAkun(login.user_id);
                          if (verif.status_akun == "Verified") {
                            // fetch data profile
                            await profile.fetchData(login.user_id);
                            print(verif.status_akun);
                            if (login.jenis_user == "Investor") {
                              Navigator.pushNamed(
                                  context, '/dashboardInvestor');
                            } else {
                              Navigator.pushNamed(context, '/dashboardUMKM');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Error: Data akun belum lengkap!'),
                              ),
                            );
                          }
                        }
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
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
