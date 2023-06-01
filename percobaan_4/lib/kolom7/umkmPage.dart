import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UMKMPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200]!,
        appBar: AppBar(
          backgroundColor: Colors.purple[800]!,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
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
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      initialPage: 2,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF977EF2),
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Text(
                                'UMKM image $i',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Status',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Rating',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(children: [
                          ListTile(
                            title: Text('Jumlah Pinjaman',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Rp 10.000.000'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                            title: Text('Tenor',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('12 Bulan'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                            title: Text('Bunga Efektif',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('14% per tahun'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                            title: Text('Agunan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Tanah dan Bangunan'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                            title: Text('Frekuensi Angsuran Pokok',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Bulanan'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                            title: Text('Frekuensi Angsuran Bunga',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Bulanan'),
                            trailing: IconButton(
                                icon: Icon(Icons.help_outline),
                                onPressed: null),
                          ),
                          ListTile(
                              title: Text('Mulai Penggalangan Dana',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('1 Januari 2022')),
                          ListTile(
                              title: Text('Akhir Penggalangan Dana',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('31 Januari 2022')),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tambahkan kode aksi yang ingin Anda jalankan saat tombol ditekan
                          Navigator.pushNamed(context, '/MulaiPendanaanInvestor');
                        },
                        child: Text(
                          'Mulai Pendanaan',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Tujuan Penggalangan Dana',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                            ListTile(
                              title: Text(
                                'Jaminan dan Agunan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/IdentitasUsaha');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Identitas Usaha',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}