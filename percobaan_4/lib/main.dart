import 'package:flutter/material.dart';
import 'package:percobaan_4/Kolom1/WelcomePage.dart';
import 'package:percobaan_4/route/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomePage',
      routes: routes,
      home: WelcomePage(),
    );
  }
}
