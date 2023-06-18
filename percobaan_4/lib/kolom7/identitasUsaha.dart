import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class IdentitasUsaha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Consumer<PinjamanUser>(
                builder: (context, pinjaman, child) => Column(
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
                                'Nama UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.nama_umkm),
                            ),
                            ListTile(
                              title: Text(
                                'Alamat UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.alamat_umkm),
                            ),
                            ListTile(
                              title: Text(
                                'Bentuk UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.bentuk_umkm),
                            ),
                            ListTile(
                              title: Text(
                                'Kategori UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.kategori_umkm),
                            ),
                            ListTile(
                              title: Text(
                                'Kontak UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.kontak_umkm),
                            ),
                            ListTile(
                              title: Text(
                                'Jumlah Karyawan',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                  pinjaman.dataUMKM.jumlah_karyawan.toString()),
                            ),
                            ListTile(
                              title: Text(
                                'Omset per bulan',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                  pinjaman.dataUMKM.omset_bulanan.toString()),
                            ),
                            ListTile(
                              title: Text(
                                'Deskripsi UMKM',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(pinjaman.dataUMKM.deskripsi_umkm),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
