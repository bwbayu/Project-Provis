import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class Pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer2<PinjamanUser, Wallet>(
          builder: (context, pinjaman, wallet, child) =>
          Column(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Rincian Pendanaan',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.purple[800]!,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah pinjaman',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + pinjaman.pinjamanList![index].jumlah_pinjaman.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pinjaman terkumpul',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + pinjaman.pinjamanList![index].pinjaman_terkumpul.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bunga',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                       'Rp ' + ((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))/100)).toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah pengembalian',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + ((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))/100)+ (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)).toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.purple[800]!,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Saldo',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + wallet.saldo.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jumlah pengembalian',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + ((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))/100)+ (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)).toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Saldo Tersisa',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        'Rp ' + (wallet.saldo-((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))/100)+ (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))).toString(),
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jumlah Pengembalian',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Outfit',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rp ' + ((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))/100)+ (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)).toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Outfit',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            // cek saldo umkm
                            // 
                            Navigator.pushNamed(context, '/dashboardUMKM');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Text(
                            'Bayar',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Outfit',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
