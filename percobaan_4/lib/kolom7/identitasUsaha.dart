import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdentitasUsaha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200]!,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
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
                          title: Text(
                            'Bentuk Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('CV'),
                        ),
                        ListTile(
                          title: Text(
                            'Domisili Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('Jakarta'),
                        ),
                        ListTile(
                          title: Text(
                            'Tahun Pendirian Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('2010'),
                        ),
                        ListTile(
                          title: Text(
                            'Group Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('Konstruksi'),
                        ),
                        ListTile(
                          title: Text(
                            'Kategori Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
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
                                  title: Text(
                                    'Nama Toko:',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text('Toko Sinar')),
                              ListTile(
                                  title: Text(
                                    'Pemilik:',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text('Budi')),
                              ListTile(
                                  title: Text(
                                    'Alamat:',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text('Jl. Merdeka No. 1')),
                              ListTile(
                                  title: Text(
                                    'Deskripsi Toko:',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
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
