import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdentitasUsaha extends StatelessWidget {
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
                    'Identitas Usaha',
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
                          title: Text('Bentuk Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('CV'),
                        ),
                        ListTile(
                          title: Text('Domisili Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Jakarta'),
                        ),
                        ListTile(
                          title: Text('Tahun Pendirian Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('2010'),
                        ),
                        ListTile(
                          title: Text('Group Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Konstruksi'),
                        ),
                        ListTile(
                          title: Text('Kategori Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Menengah'),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(children: [
                              ListTile(
                                  title: Text('Nama Toko:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text('Toko Sinar')),
                              ListTile(
                                  title: Text('Pemilik:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text('Budi')),
                              ListTile(
                                  title: Text('Alamat:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text('Jl. Merdeka No. 1')),
                              ListTile(
                                  title: Text('Deskripsi Toko:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      'Toko yang menjual berbagai macam kebutuhan rumah tangga')),
                            ]))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
