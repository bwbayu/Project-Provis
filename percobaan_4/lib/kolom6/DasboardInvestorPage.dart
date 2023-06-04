import 'package:flutter/material.dart';
import 'package:percobaan_4/kolom5/wallet.dart';
import 'package:percobaan_4/kolom6/InvestorPage.dart';
import 'package:percobaan_4/kolom6/ListUmkm.dart';
import 'package:percobaan_4/kolom4/ProfilePage.dart';
import 'package:percobaan_4/kolom8/portofolio.dart';

class DashboardInvestor extends StatefulWidget {
  @override
  _DashboardInvestorState createState() => _DashboardInvestorState();
}

class _DashboardInvestorState extends State<DashboardInvestor> {
  int currentIndex = 0;
  final screens = [
    InvestorPage(),
    Portofolio(),
    listUMKM(),
    wallet(),
    profilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200]!,
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
              icon: Icon(Icons.book),
              selectedIcon: Icon(Icons.book),
              label: 'Portofolio',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              selectedIcon: Icon(Icons.list),
              label: 'UMKM List',
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
