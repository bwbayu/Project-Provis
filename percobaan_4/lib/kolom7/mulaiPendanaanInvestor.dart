// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

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
            child: Consumer2<PinjamanUser, PendaaanProvider>(
              builder: (context, pinjaman, pendanaan, child){
              return Column(
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
                          Consumer<Wallet>(
                            builder: (context, wallet, child) =>
                            ListTile(
                              title: Text(
                                'Saldo Anda',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text("Rp " + wallet.saldo.toString()),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Jumlah Pinjaman',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text("Rp " + pinjaman.listPinjamanOpen![index]
                                .jumlah_pinjaman.toString()),
                          ),
                          ListTile(
                            title: Text(
                              'Pinjaman Terkumpul',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text("Rp " + pinjaman.listPinjamanOpen![index]
                                .pinjaman_terkumpul.toString()),
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
                            subtitle: Text(pinjaman
                                .listPinjamanOpen![index].bunga_pinjaman),
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
                          icon: Icon(Icons.calculate),
                          onPressed: () {
                            // Perform calculations or any action here
                          },
                        ),
                        hintText: 'Masukkan jumlah pinjaman',
                      ),
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        pendanaan.jumlahPendanaan = double.parse(value);
                        pendanaan.bunga = ((pinjaman.listPinjamanOpen?[index].bungaPinjaman ?? 0) * (pendanaan.jumlahPendanaan))/100;
                        pendanaan.targetPengembalian = pendanaan.jumlahPendanaan + pendanaan.bunga;
                      },
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
                            subtitle: Text(
                                'Rp' + pendanaan.jumlahPendanaan.toString()),
                          ),
                          ListTile(
                              title: Text(
                                'Bunga',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text('Rp' + pendanaan.bunga.toString(),),
                            ),
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
                              subtitle: Text('Rp' + pendanaan.targetPengembalian.toString())),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                    child: Consumer5<VerifikasiAkun, RiwayatWalletProvider, Wallet, Login, PendanaanData>(
                      builder: (context, verif, riwayat, wallet, login, dataPendanaan, child) =>
                      ElevatedButton(
                        onPressed: () async {
                          if(riwayat.isLoading || riwayat.isLoading1 || wallet.isLoading || pendanaan.isLoading || dataPendanaan.isLoading || pinjaman.isLoading1){
                            return;
                          }
                          // SALDO USER BAKAL BERKURANG DAN DANA PINJAMAN BAKAL BERTAMBAH
                          // cek status akun user
                          if (verif.status_akun == "Verified") {
                            if(pendanaan.jumlahPendanaan % 10000 == 0){
                              if(pendanaan.jumlahPendanaan != 0){
                                // (CEK PINJAMAN_TERKUMPUL + JUMLAH_PENDAAAN <= JUMLAH_PINJAMAN)
                                if(pinjaman.listPinjamanOpen![index].pinjaman_terkumpul + pendanaan.jumlahPendanaan <= pinjaman.listPinjamanOpen![index].jumlah_pinjaman){
                                  // update riwayat investor user, otomatis saldonya berkurang -> cek dlu saldonya
                                  if(pendanaan.jumlahPendanaan <= wallet.saldo){
                                    // assign data riwayat
                                    riwayat.keterangan = "Pendanaan UMKM";
                                    riwayat.statusTransaksi = "Keluar";
                                    riwayat.saldoTransaksi = pendanaan.jumlahPendanaan;
                                    // update riwayat wallet
                                    await riwayat.addRiwayatWallet(wallet.wallet_id);
                                    // fetch data riwayat
                                    await riwayat.fetchDataRiwayatWallet(wallet.wallet_id);
                                    // fetch data wallet
                                    await wallet.fetchData(login.user_id);
                                    // add data ke pendanaan, update pinjaman terkumpul dari id_pinjaman ini, cek dan update status_pinjaman
                                    pendanaan.pinjaman_id = pinjaman.listPinjamanOpen![index].pinjaman_id;
                                    await pendanaan.addPendanaan(login.user_id);
                                    // fetch data pendanaan ke porfolio
                                    await dataPendanaan.fetchDataPendanaan(login.user_id);
                                    // fetch data pinjaman status open
                                    await pinjaman.fetchDataPinjamanOpen();
                                    // reset variable pendanaan
                                    pendanaan.reset(); 
                                    // reset variable riwayat
                                    riwayat.reset();
                                    // 
                                    Navigator.pushNamed(context, '/dashboardInvestor');
                                  }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: Saldo anda tidak cukup'),
                                    ),
                                  );
                                }
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: Jumlah pendanaan sudah melebihi jumlah pinjaman yang diajukan'),
                                    ),
                                  );
                                }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: Jumlah pendanaan tidak boleh 0'),
                                  ),
                                );
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: Jumlah pendanaan harus berkelipatan Rp 10.000'),
                                ),
                              );
                            }
                          } else {
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
                          backgroundColor: riwayat.isLoading || riwayat.isLoading1 || wallet.isLoading || pendanaan.isLoading || dataPendanaan.isLoading || pinjaman.isLoading1
                              ? Colors.grey // Disabled button color when loading
                              : Color(0xFF977EF2), // Set the desired button color here
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
              );
              }
            ),
          ),
        ),
      ),
    );
  }
}
