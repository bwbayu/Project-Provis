import 'package:flutter/material.dart';
import 'package:percobaan_4/Kolom1/WelcomePage.dart';
import 'package:percobaan_4/route/routes.dart';
import 'package:provider/provider.dart';
import 'model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Register()),
        ChangeNotifierProvider(create: (_) => Login()),
        ChangeNotifierProvider(create: (_) => Wallet(saldo: 0, wallet_id: 0)),
        ChangeNotifierProvider(create: (_) => VerifikasiAkun()),
      ],
      child: MyApp(),
      )
  );
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
