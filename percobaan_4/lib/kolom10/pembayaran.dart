import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
        child: Consumer4<PinjamanUser, Wallet, PembayaranProvider,
            RiwayatWalletProvider>(
          builder: (context, pinjaman, wallet, pembayaran, riwayat, child) =>
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        // 'Rp ' +
                                        //     pinjaman.pinjamanList![index]
                                        //         .jumlah_pinjaman
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pinjaman.pinjamanList![index].jumlah_pinjaman)}",
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
                                        // 'Rp ' +
                                        //     pinjaman.pinjamanList![index]
                                        //         .pinjaman_terkumpul
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pinjaman.pinjamanList![index].pinjaman_terkumpul)}",
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
                                        // 'Rp ' +
                                        //     ((((pinjaman.pinjamanList?[index]
                                        //                         .bungaPinjaman ??
                                        //                     0) *
                                        //                 (pinjaman
                                        //                         .pinjamanList?[
                                        //                             index]
                                        //                         .pinjaman_terkumpul ??
                                        //                     0)) /
                                        //             100))
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)) / 100)))}",
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
                                        // 'Rp ' +
                                        //     ((((pinjaman.pinjamanList?[index]
                                        //                             .bungaPinjaman ??
                                        //                         0) *
                                        //                     (pinjaman
                                        //                             .pinjamanList?[
                                        //                                 index]
                                        //                             .pinjaman_terkumpul ??
                                        //                         0)) /
                                        //                 100) +
                                        //             (pinjaman
                                        //                     .pinjamanList?[
                                        //                         index]
                                        //                     .pinjaman_terkumpul ??
                                        //                 0))
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)) / 100) + (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)))}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        // 'Rp ' + wallet.saldo.toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(wallet.saldo)}",
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
                                        // 'Rp ' +
                                        //     ((((pinjaman.pinjamanList?[index]
                                        //                             .bungaPinjaman ??
                                        //                         0) *
                                        //                     (pinjaman
                                        //                             .pinjamanList?[
                                        //                                 index]
                                        //                             .pinjaman_terkumpul ??
                                        //                         0)) /
                                        //                 100) +
                                        //             (pinjaman
                                        //                     .pinjamanList?[
                                        //                         index]
                                        //                     .pinjaman_terkumpul ??
                                        //                 0))
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)) / 100) + (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)))}",
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
                                        // 'Rp ' +
                                        //     (wallet.saldo -
                                        //             ((((pinjaman
                                        //                                 .pinjamanList?[
                                        //                                     index]
                                        //                                 .bungaPinjaman ??
                                        //                             0) *
                                        //                         (pinjaman
                                        //                                 .pinjamanList?[
                                        //                                     index]
                                        //                                 .pinjaman_terkumpul ??
                                        //                             0)) /
                                        //                     100) +
                                        //                 (pinjaman
                                        //                         .pinjamanList?[
                                        //                             index]
                                        //                         .pinjaman_terkumpul ??
                                        //                     0)))
                                        //         .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format((wallet.saldo - ((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)) / 100) + (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0))))}",
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
                            // 'Rp ' +
                            //     ((((pinjaman.pinjamanList?[index]
                            //                             .bungaPinjaman ??
                            //                         0) *
                            //                     (pinjaman.pinjamanList?[index]
                            //                             .pinjaman_terkumpul ??
                            //                         0)) /
                            //                 100) +
                            //             (pinjaman.pinjamanList?[index]
                            //                     .pinjaman_terkumpul ??
                            //                 0))
                            //         .toString(),
                            "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(((((pinjaman.pinjamanList?[index].bungaPinjaman ?? 0) * (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)) / 100) + (pinjaman.pinjamanList?[index].pinjaman_terkumpul ?? 0)))}",
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
                        child: Consumer<Login>(
                          builder: (context, login, child) => ElevatedButton(
                            onPressed: () async {
                              // cek saldo umkm
                              if (wallet.saldo >=
                                  pembayaran.jumlah_pembayaran) {
                                // assign data riwayat
                                riwayat.keterangan = "Pembayaran Pinjaman";
                                riwayat.statusTransaksi = "Keluar";
                                riwayat.saldoTransaksi =
                                    pembayaran.jumlah_pembayaran;
                                // update riwayat wallet
                                await riwayat
                                    .addRiwayatWallet(wallet.wallet_id);
                                // fetch data riwayat
                                await riwayat
                                    .fetchDataRiwayatWallet(wallet.wallet_id);
                                // fetch data wallet
                                await wallet.fetchData(login.user_id);
                                // update status pinjaman & status pembayaran ke lunas
                                await pembayaran.updateStatusPembayaran(
                                    pinjaman.pinjamanList![index].pinjaman_id);
                                // reset data riwayat
                                riwayat.reset();
                                // fetch data list pinjaman user
                                await pinjaman.fetchDataPinjaman(login.user_id);
                                Navigator.pushNamed(context, '/dashboardUMKM');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: Saldo tidak cukup'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  EdgeInsets.zero, // Remove default padding
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
