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
// kolom 7
import 'package:percobaan_4/kolom7/identitasUsaha.dart';
import 'package:percobaan_4/kolom7/mulaiPendanaanInvestor.dart';
import 'package:percobaan_4/kolom7/syarat&ketentuan.dart';
import 'package:percobaan_4/kolom7/umkmPage.dart';
// kolom 8
import 'package:percobaan_4/kolom8/detailPortofolio.dart';
import 'package:percobaan_4/kolom8/portofolio.dart';
// kolom 9
import 'package:percobaan_4/kolom9/DasboardUmkmPage.dart';
// kolom 10
import 'package:percobaan_4/kolom10/listPinjaman.dart';
import 'package:percobaan_4/kolom10/pembayaran.dart';
import 'package:percobaan_4/kolom10/rincianPinjaman.dart';
// kolom 11
import 'package:percobaan_4/kolom11/DataIdentitasPage.dart';
import 'package:percobaan_4/kolom11/InformasiBankPage.dart';
import 'package:percobaan_4/kolom11/PengajuanPinjaman.dart';
// kolom 12
import 'package:percobaan_4/kolom12/BankCardsPage.dart';
import 'package:percobaan_4/kolom12/TambahRekeningPage.dart';
// kolom 14
import 'package:percobaan_4/kolom14/CallCenterPage.dart';
import 'package:percobaan_4/kolom14/FAQPage.dart';
import 'package:percobaan_4/kolom14/HelpCenterPage.dart';
import 'package:percobaan_4/kolom14/PoinHelpPage.dart';

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
  '/profile': (context) => profilePage(),
  // kolom 5
  '/isiDana': (context) => isiDana(),
  '/tarikDana': (context) => tarikDana(),
  '/wallet': (context) => wallet(),
  // kolom 6
  '/dashboardInvestor': (context) => DashboardInvestor(),
  // kolom 7
  '/IdentitasUsaha': (context) => IdentitasUsaha(),
  '/MulaiPendanaanInvestor': (context) => MulaiPendanaanInvestor(),
  '/SyaratKetentuan': (context) => SyaratKetentuan(),
  '/UMKMPage': (context) => UMKMPage(),
  // kolom 8
  '/detailPortofolio': (context) => detailPortofolio(),
  '/Portofolio': (context) => Portofolio(),
  // kolom 9
  '/dashboardUMKM': (context) => DashboardUmkm(),
  // kolom 10
  '/listPinjaman': (context) => listPinjaman(),
  '/Pembayaran': (context) => Pembayaran(),
  '/rincianPinjaman': (context) => rincianPinjaman(),
  // kolom 11
  '/DataIdentitasUMKM': (context) => DataIdentitasUMKM(),
  '/PengajuanPinjamanPage': (context) => PengajuanPinjamanPage(),
  '/InformasiBankPage': (context) => InformasiBankPage(),
  // kolom 12
  '/BankAndCardsPage': (context) => BankAndCardsPage(),
  '/TambahRekeningPage': (context) => TambahRekeningPage(),
  // kolom 14
  '/CallCenterPage': (context) => CallCenterPage(),
  '/FAQPage': (context) => FAQPage(),
  '/HelpCenterPage': (context) => HelpCenterPage(),
  '/PoinHelpPage': (context) => PoinHelpPage(),
};
