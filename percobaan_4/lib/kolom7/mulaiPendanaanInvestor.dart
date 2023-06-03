// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class MulaiPendanaanInvestor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pendanaan Investor',
//       theme: ThemeData(primarySwatch: Colors.purple),
//       home: Page(),
//     );
//   }
// }

class MulaiPendanaanInvestor extends StatelessWidget {
  double _loanAmount = 0;
  double _interestRate = 0.14;
  int _tenor = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200]!,
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
      body: Container(
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
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Mulai Pendanaan',
                    style: TextStyle(
                        fontSize: 24,
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
                          title: Text('Lama Tenor',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('$_tenor Bulan'),
                        ),
                        ListTile(
                          title: Text('Bunga Efektif',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${_interestRate * 100}% per tahun'),
                        ),
                        ListTile(
                          title: Text('Frekuensi Angsuran Bunga',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Bulanan'),
                        ),
                        ListTile(
                          title: Text('Frekuensi Angsuran Pokok',
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                            title: Text('Jumlah Pinjaman'),
                            subtitle:
                                Text('Rp ${_loanAmount.toStringAsFixed(2)}')),
                        ListTile(
                            title: Text('Bunga'),
                            subtitle: Text(
                                'Rp ${(_loanAmount * _interestRate).toStringAsFixed(2)}')),
                        Divider(),
                        ListTile(
                            title: Text('Target Pengembalian'),
                            subtitle: Text(
                                'Rp ${(_loanAmount * (1 + _interestRate)).toStringAsFixed(2)}')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // SALDO USER BAKAL BERKURANG DAN DANA PINJAMAN BAKAL BERTAMBAH
                      Navigator.pushNamed(context, '/dashboardInvestor');
                    },
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
    );
  }
}
