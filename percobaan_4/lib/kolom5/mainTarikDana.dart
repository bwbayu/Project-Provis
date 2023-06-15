import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class TarikDanaPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Consumer5<WithdrawalState, Wallet, BankUser,
            RiwayatWalletProvider, Login>(
          builder: (context, withdraw, wallet, bank, riwayat, login, child) =>
              Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "asset/images/backgroundpolos.png", // Background image
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      leading: IconButton(
                        onPressed: () {
                          withdraw.reset();
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(
                          'asset/images/vector.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      title: Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Container(
                            width: 350, // lebar kontainer
                            height: 200, // tinggi kontainer
                            child: Image.asset(
                              'asset/images/tarikdana.png',
                              fit: BoxFit
                                  .cover, // atur ukuran gambar sesuai ukuran kontainer
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Metode Pembayaran: ',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    bank.bank!.listBank[index].nama_bank,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Nama Pemilik : " +
                                        bank.bank!.listBank[index]
                                            .nama_pemilik_bank,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(),
                                  Text(
                                    "Nomor Rekening : " +
                                        bank.bank!.listBank[index]
                                            .nomor_rekening,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Saldo',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Rp' + wallet.saldo.toString(),
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      child: Text(
                        'Masukkan Nominal Tarik Saldo',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _textEditingController,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Rp 100000',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) =>
                            withdraw.nominal = double.parse(value),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp10.000";
                                    _textEditingController.text = "10000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp10.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp20.000";
                                    _textEditingController.text = "20000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp20.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp50.000";
                                    _textEditingController.text = "50000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp50.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp100.000";
                                    _textEditingController.text = "100000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp100.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp200.000";
                                    _textEditingController.text = "200000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp200.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    withdraw.showAdditionalInput = "Rp500.000";
                                    _textEditingController.text = "500000";
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors
                                        .orangeAccent, // Warna latar belakang
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'Rp500.000',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () async {
                          // assign data
                          riwayat.keterangan = "Tarik Saldo";
                          riwayat.statusTransaksi = "Keluar";
                          riwayat.saldoTransaksi = withdraw.nominal;
                          // cek nominal
                          if (riwayat.saldoTransaksi <= wallet.saldo) {
                            if (riwayat.saldoTransaksi != 0) {
                              final statusCode = await riwayat
                                  .addRiwayatWallet(wallet.wallet_id);
                              print(statusCode);
                              if (statusCode == 200) {
                                // fetch data riwayat wallet
                                await riwayat
                                    .fetchDataRiwayatWallet(wallet.wallet_id);
                                // fetch data wallet
                                await wallet.fetchData(login.user_id);
                                if (login.jenis_user == "Investor") {
                                  Navigator.pushNamed(
                                      context, '/dashboardInvestor');
                                } else {
                                  Navigator.pushNamed(
                                      context, '/dashboardUMKM');
                                }
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: Isi nominal isi saldo'),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: Saldo tidak mencukupi'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .orangeAccent, // Same background color as other buttons
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: Center(
                            child: Text(
                              'Konfirmasi',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
