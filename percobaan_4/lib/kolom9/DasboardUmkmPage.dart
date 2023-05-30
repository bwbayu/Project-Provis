import 'package:flutter/material.dart';
import 'package:percobaan_4/kolom10/listPinjaman.dart';
import 'package:percobaan_4/kolom5/wallet.dart';
import 'package:percobaan_4/kolom4/ProfilePage.dart';
import 'package:percobaan_4/kolom9/UmkmDash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UMKM',
      home: DashboardUmkm(),
    );
  }
}

class DashboardUmkm extends StatefulWidget {
  @override
  _DashboardUmkmState createState() => _DashboardUmkmState();
}

class _DashboardUmkmState extends State<DashboardUmkm> {
  int currentIndex = 0;
  final screens = [UmkmDash(), listPinjaman(), wallet(), profilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          indicatorColor: Colors.blue.shade100,
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Color(0xFFf1f5fb),
          selectedIndex: currentIndex,
          onDestinationSelected: (index) =>
              setState(() => this.currentIndex = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              selectedIcon: Icon(Icons.list),
              label: 'List',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_balance_wallet),
              selectedIcon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
