import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendanaan',
      home: PendanaanPage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class PendanaanPage extends StatefulWidget {
  @override
  _PendanaanPageState createState() => _PendanaanPageState();
}

class _PendanaanPageState extends State<PendanaanPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle back button tap
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'List UMKM',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                            width: double.infinity,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp xxx',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffcb5f18),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                            width: double.infinity,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp xxx',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffcb5f18),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.purple,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
