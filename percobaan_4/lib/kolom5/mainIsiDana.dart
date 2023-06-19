import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

// class IsiDanaPage extends StatefulWidget {
//   @override
//   _IsiDanaPageState createState() => _IsiDanaPageState();
// }

class IsiDanaPage extends StatelessWidget{
  final TextEditingController _textEditingController = TextEditingController();
  // bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    String bankName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Consumer4<WithdrawalState, Wallet, RiwayatWalletProvider, Login>(
          builder: (context, withdraw, wallet, riwayat, login, child) => Stack(
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
                          riwayat.reset();
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
                                    bankName,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orangeAccent,
                                      fontSize: 20,
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
                        'Masukkan Nominal Isi Saldo',
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
                          onChanged: (value) {
                            withdraw.nominal = double.parse(value);
                          }),
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
                        onPressed: () async{
                          // Disable the button while the transaction is being processed
                          if (riwayat.isLoading || riwayat.isLoading1 || wallet.isLoading) {
                            return;
                          }
                          // assign data
                          riwayat.keterangan = "Isi Saldo";
                          riwayat.statusTransaksi = "Masuk";
                          riwayat.saldoTransaksi = withdraw.nominal;
                          // cek nominal
                          if (riwayat.saldoTransaksi != 0) {
                            final statusCode = await riwayat.addRiwayatWallet(wallet.wallet_id);
                            if(statusCode == 200) {
                              // fetch data riwayat wallet
                              await riwayat.fetchDataRiwayatWallet(wallet.wallet_id);
                              // fetch data wallet
                              await wallet.fetchData(login.user_id);
                              // reset data riwayat
                              riwayat.reset();
                              if(login.jenis_user == "Investor"){
                                Navigator.pushNamed(context, '/dashboardInvestor');
                              }else{
                                Navigator.pushNamed(context, '/dashboardUMKM');
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Error: Isi nominal isi saldo'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .orangeAccent, // Same background color as other buttons
                          backgroundColor: riwayat.isLoading || riwayat.isLoading1 || wallet.isLoading
                              ? Colors.grey // Disabled button color when loading
                              : Colors.orangeAccent, // Set the desired button color here
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
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

