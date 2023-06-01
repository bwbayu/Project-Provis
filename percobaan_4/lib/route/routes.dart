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
  '/welcomePage': (context) => WelcomePage(), // foto
  '/loginPage': (context) => LoginScreen(), //aman
  '/roleSelectionPage': (context) => RolePage(), //aman
  '/registerPage': (context) => RegisterPage(), //aman
  // kolom 2
  '/formData': (context) => formData(), //aman
  '/formKTP': (context) =>
      formKTP(), // ganti pake upload image, ketika user upload image, imagenya bakal ke show di containernya
  '/formNPWP': (context) =>
      formNPWP(), // ganti pake upload image, ketika user upload image, imagenya bakal ke show di containernya
  '/formTTD': (context) =>
      formTTD(), // ganti pake upload image, ketika user upload image, imagenya bakal ke show di containernya
  // kolom 3
  '/akunBank': (context) => akunBank(), // aman
  '/dataDiri': (context) =>
      dataDiri(), // button lanjutkan, harusnya diem dibawah kanan doang
  '/formVerifikasi': (context) => formVerifikasi(), //aman
  // kolom 4
  '/dataAkun': (context) => InformasiAkunPage(), //aman
  '/profile': (context) => profilePage(), //aman
  // kolom 5
  '/isiDana': (context) => isiDana(), // data bank (icon sama nama bank),
  '/tarikDana': (context) => tarikDana(), //aman
  '/wallet': (context) => wallet(), // aman
  // kolom 6
  '/dashboardInvestor': (context) =>
      DashboardInvestor(), // search ganti saldo, rekomendasi bisa di slider, whats on your mind mau apa aja,
  // list umkm = bisa ditambah search button, filter, (?)
  // kolom 7
  '/IdentitasUsaha': (context) => IdentitasUsaha(), //aman
  '/MulaiPendanaanInvestor': (context) => MulaiPendanaanInvestor(), //aman
  '/SyaratKetentuan': (context) => SyaratKetentuan(), //aman
  '/UMKMPage': (context) => UMKMPage(), //aman
  // kolom 8
  '/detailPortofolio': (context) => detailPortofolio(), //aman
  '/Portofolio': (context) => Portofolio(), //aman
  // kolom 9
  '/dashboardUMKM': (context) =>
      DashboardUmkm(), // search ganti saldo, pinjaman dibikin slider (kasih ada 3/5 item), bagian what's on your mind bagusin lgi + disitu mau ditaro apa aja (pake icon ?), di dashboard UMKM mau ditaro apa lagi ?
  // kolom 10
  '/listPinjaman': (context) =>
      listPinjaman(), // tab button (terbaru, selesai, semua), card buat pinjaman (tampilannya) di list view builder
  '/Pembayaran': (context) => Pembayaran(), //aman
  '/rincianPinjaman': (context) => rincianPinjaman(), //aman
  // kolom 11
  '/DataIdentitasUMKM': (context) => DataIdentitasUMKM(), //aman
  '/PengajuanPinjamanPage': (context) => PengajuanPinjamanPage(), //aman
  '/InformasiBankPage': (context) => InformasiBankPage(), // dihapus
  // kolom 12
  '/BankAndCardsPage': (context) => BankAndCardsPage(), //aman
  '/TambahRekeningPage': (context) => TambahRekeningPage(), //aman
  // kolom 14
  '/CallCenterPage': (context) => CallCenterPage(), //aman
  '/FAQPage': (context) => FAQPage(), //aman
  '/HelpCenterPage': (context) => HelpCenterPage(), //aman
  '/PoinHelpPage': (context) => PoinHelpPage(title: ''), //aman
};
