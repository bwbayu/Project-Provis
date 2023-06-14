import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class rincianPinjaman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
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
          child: Consumer<PinjamanUser>(
            builder: (context, pinjaman, child) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pinjaman '+ (index + 1).toString(),
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.purple[200]!,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              pinjaman.pinjamanList![index].status_pinjaman,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 140,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dana Pinjaman',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.purple[200]!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  'Rp.'+pinjaman.pinjamanList![index].jumlah_pinjaman.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dana Pengembalian',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.purple[200]!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  'Rp.xxxxxx',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 140,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Waktu Pendanaan',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.purple[200]!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  pinjaman.pinjamanList![index].tgl_pengajuan,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Waktu Tenggang',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.purple[200]!,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  pinjaman.pinjamanList![index].tgl_tenggang,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[800]!,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Lama Tenor',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman.pinjamanList![index].tenor_pinjaman,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Bunga Efektif',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman.pinjamanList![index].bunga_pinjaman,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Frekuensi Angsuran Pokok',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman.pinjamanList![index].frekuensi_angsuran_pokok,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Frekuensi Angsuran Bunga',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Bulanan',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Pembayaran');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF977EF2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'Bayar',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 18,
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
