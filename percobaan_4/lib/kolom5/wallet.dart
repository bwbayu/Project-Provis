import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class wallet extends StatelessWidget {
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: Text(
                          'Saldo',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Consumer<Wallet>(
                              builder: (context, wallet, child) => Text(
                                'Rp. ' + wallet.saldo.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Consumer3<BankUser, Login, RiwayatWalletProvider>(
                  builder: (context, dataBank, login, riwayat, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // fetch data bank user
                              final statusCode =
                                  await dataBank.fetchDataBank(login.user_id);
                              print(statusCode);
                              if (statusCode == 200) {
                                Navigator.pushNamed(context, '/tarikDana');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tarik Dana',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[200]!,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              'Total Dana Keluar',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'Rp ' + riwayat.totalTransaksiKeluar.toString(),
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/isiDana');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Isi Dana',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[200]!,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              'Total Dana Masuk',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              'Rp ' + riwayat.totalTransaksiMasuk.toString(),
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Riwayat Wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Consumer<RiwayatWalletProvider>(
                      builder: (context, riwayat, child) {
                    return riwayat.isLoading
                        ? CircularProgressIndicator()
                        : riwayat.listRiwayatWallet != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          riwayat.listRiwayatWallet!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        IconData trailingIcon;
                                        Color trailingColor;

                                        if (riwayat.listRiwayatWallet![index].statusTransaksi =="Masuk") {
                                          trailingIcon = Icons.arrow_upward;
                                          trailingColor = Colors.green;
                                        } else if (riwayat.listRiwayatWallet![index].statusTransaksi =="Keluar") {
                                          trailingIcon = Icons.arrow_downward;
                                          trailingColor = Colors.red;
                                        } else {
                                          trailingIcon =
                                              Icons.arrow_forward_ios;
                                          trailingColor = Colors.white;
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 20, 5),
                                          child: Container(
                                            width: 100,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.purple[800]!,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                riwayat
                                                    .listRiwayatWallet![index]
                                                    .keterangan,
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Rp ' +
                                                    riwayat
                                                        .listRiwayatWallet![
                                                            index]
                                                        .saldoTransaksi
                                                        .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              trailing: Icon(
                                                trailingIcon,
                                                color: trailingColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
