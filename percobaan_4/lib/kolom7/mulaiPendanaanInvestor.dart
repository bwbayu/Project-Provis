// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class MulaiPendanaanInvestor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Consumer2<VerifikasiAkun, PinjamanUser>(
              builder: (context, verif, pinjaman, child) =>
              Column(
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
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Mulai Pendanaan',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(children: [
                          ListTile(
                            title: Text(
                              'Lama Tenor',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(pinjaman.listPinjamanOpen![index].tenor_pinjaman),
                          ),
                          ListTile(
                            title: Text(
                              'Bunga Efektif',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(pinjaman.listPinjamanOpen![index].bunga_pinjaman),
                          ),
                          ListTile(
                            title: Text(
                              'Frekuensi Angsuran Bunga',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(pinjaman.listPinjamanOpen![index].frekuensi_angsuran_pokok),
                          ),
                          ListTile(
                            title: Text(
                              'Frekuensi Angsuran Pokok',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text('Bulanan'),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Jumlah Pemberian Pinjaman',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.calculate), onPressed: () {}),
                          hintText: 'Masukkan jumlah pinjaman'),
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                'Jumlah Pinjaman',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle:
                                  Text('Rp')),
                          ListTile(
                              title: Text(
                                'Bunga',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                  'Rp')),
                          Divider(),
                          ListTile(
                              title: Text(
                                'Target Pengembalian',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                  'Rp')),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // SALDO USER BAKAL BERKURANG DAN DANA PINJAMAN BAKAL BERTAMBAH
                        // cek status akun user
                        if(verif.status_akun == "Verified"){
                          Navigator.pushNamed(context, '/dashboardInvestor');
                        }else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: Akun anda belum verified'),
                              ),
                            );
                          }
                      },
                      child: Text(
                        "Lanjutkan",
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF977EF2),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/SyaratKetentuan');
                          },
                          child: Text("Syarat dan Ketentuan",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
