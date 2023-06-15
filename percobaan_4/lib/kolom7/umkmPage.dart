import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class UMKMPage extends StatelessWidget {
  final List<String> umkmImages = [
    'asset/images/umkm_image_1.jpg',
    'asset/images/umkm_image_2.jpg',
    'asset/images/umkm_image_3.jpg',
    'asset/images/umkm_image_4.jpg',
    'asset/images/umkm_image_5.jpg',
  ];

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
          child: Consumer<PinjamanUser>(
            builder:(context, pinjaman, child) =>
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
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF977EF2),
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded edges
                          ),
                          child: Image.asset(
                            umkmImages[i - 1], // Select the image based on index
                            fit: BoxFit.cover,
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
                                pinjaman.listPinjamanOpen![index].status_pinjaman,
                                style: TextStyle(
                                    fontFamily: 'Outfit', color: Colors.black),
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
                                'rating',
                                style: TextStyle(
                                    fontFamily: 'Outfit', color: Colors.black),
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
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan kode aksi yang ingin Anda jalankan saat tombol ditekan
                        Navigator.pushNamed(context, '/MulaiPendanaanInvestor', arguments: index);
                      },
                      child: Text(
                        'Mulai Pendanaan',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
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
                      child: Column(children: [
                        ListTile(
                          title: Text(
                            'Jumlah Pinjaman',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('Rp '+ pinjaman.listPinjamanOpen![index].jumlah_pinjaman.toString()),
                          trailing: IconButton(
                              icon: Icon(Icons.help_outline), onPressed: null),
                        ),
                        ListTile(
                          title: Text(
                            'Tenor',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(pinjaman.listPinjamanOpen![index].tenor_pinjaman),
                          trailing: IconButton(
                              icon: Icon(Icons.help_outline), onPressed: null),
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
                          trailing: IconButton(
                              icon: Icon(Icons.help_outline), onPressed: null),
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
                          subtitle: Text(pinjaman.listPinjamanOpen![index].frekuensi_angsuran_pokok),
                          trailing: IconButton(
                              icon: Icon(Icons.help_outline), onPressed: null),
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
                          subtitle: Text('Bulanan'),
                          trailing: IconButton(
                              icon: Icon(Icons.help_outline), onPressed: null),
                        ),
                        ListTile(
                            title: Text(
                              'Mulai Penggalangan Dana',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(pinjaman.listPinjamanOpen![index].tgl_pengajuan)),
                        ListTile(
                            title: Text(
                              'Akhir Penggalangan Dana',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(pinjaman.listPinjamanOpen![index].tgl_tenggang)),
                          ListTile(
                            title: Text(
                              'Tujuan Penggalangan Dana',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                                pinjaman.listPinjamanOpen![index].tujuan_pinjaman),
                          ),
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
                        Navigator.pushNamed(context, '/IdentitasUsaha');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Identitas Usaha',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
      ),
    ));
  }
}
