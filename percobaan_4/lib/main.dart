import 'package:flutter/material.dart';
import 'package:percobaan_4/Kolom1/WelcomePage.dart';
import 'package:percobaan_4/route/routes.dart';
import 'package:provider/provider.dart';
import 'model.dart';
//rest

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Register()),
      ChangeNotifierProvider(create: (_) => Login()),
      ChangeNotifierProvider(create: (_) => Wallet(saldo: 0, wallet_id: 0)),
      ChangeNotifierProvider(create: (_) => VerifikasiAkun()),
      ChangeNotifierProvider(create: (_) => ProfileData()),
      ChangeNotifierProvider(create: (_) => BankData()),
      ChangeNotifierProvider(create: (_) => BankUser()),
      ChangeNotifierProvider(create: (_) => OurBank()),
      ChangeNotifierProvider(create: (_) => UmkmProvider()),
      ChangeNotifierProvider(create: (_) => PinjamanProvider()),
      ChangeNotifierProvider(create: (_) => PinjamanUser()),
      ChangeNotifierProvider(create: (_) => PendaaanProvider()),
      ChangeNotifierProvider(create: (_) => PendanaanData()),
      ChangeNotifierProvider(create: (_) => RiwayatWalletProvider()),
      ChangeNotifierProvider(create: (_) => WithdrawalState()),
      ChangeNotifierProvider(create: (_) => PembayaranProvider()),
      ChangeNotifierProvider(create: (_) => MyImageProvider()),
      ChangeNotifierProvider(create: (_) => NPWPProvider()),
      ChangeNotifierProvider(create: (_) => TTDProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tubes Provis",
      initialRoute: '/welcomePage',
      routes: routes,
      home: WelcomePage(),
    );
  }
}
