import 'package:flutter/material.dart';
// kolom 1
import 'package:percobaan_4/kolom1/WelcomePage.dart';
import 'package:percobaan_4/kolom1/LoginPage.dart';
import 'package:percobaan_4/kolom1/Register.dart';
import 'package:percobaan_4/kolom1/AccountRolePage.dart';
// kolom 2
import 'package:percobaan_4/kolom2/informasiPengisianData.dart';
import 'package:percobaan_4/kolom2/ktp.dart';
import 'package:percobaan_4/kolom2/npwp.dart';
import 'package:percobaan_4/kolom2/tandaTangan.dart';
// kolom 3
import 'package:percobaan_4/kolom3/akunBank.dart';
import 'package:percobaan_4/kolom3/dataDiri.dart';
import 'package:percobaan_4/kolom3/lengkapiProfil.dart';
// kolom 4
import 'package:percobaan_4/kolom4/InformasiAkunPage.dart';
import 'package:percobaan_4/kolom4/ProfilePage.dart';
// kolom 5
import 'package:percobaan_4/kolom5/isiDana.dart';
import 'package:percobaan_4/kolom5/tarikDana.dart';
import 'package:percobaan_4/kolom5/wallet.dart';
// kolom 6
import 'package:percobaan_4/kolom6/DasboardInvestorPage.dart';
import 'package:percobaan_4/kolom6/ListUmkm.dart';

// =====================================
final Map<String, WidgetBuilder> routes = {
  // kolom 1
  '/welcomePage': (context) => WelcomePage(),
  '/loginPage': (context) => LoginScreen(),
  '/roleSelectionPage': (context) => RolePage(),
  '/registerPage': (context) => RegisterPage(),
  // kolom 2
  '/formData': (context) => formData(),
  '/formKTP': (context) => formKTP(),
  '/formNPWP': (context) => formNPWP(),
  '/formTTD': (context) => formTTD(),
  // kolom 3
  '/akunBank': (context) => akunBank(),
  '/dataDiri': (context) => dataDiri(),
  '/formVerifikasi': (context) => formVerifikasi(),
  // kolom 4
  '/dataAkun': (context) => InformasiAkunPage(),
  '/profile': (context) => ProfilePage(),
  // kolom 5
  '/isiDana': (context) => isiDana(),
  '/tarikDana': (context) => tarikDana(),
  '/wallet': (context) => wallet(),
  // kolom 6
  '/dashboardInvestor': (context) => DashboardInvestor(),
  '/listUMKM': (context) => listUMKM(),
};
