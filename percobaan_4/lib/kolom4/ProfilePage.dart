import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isTapped = false;
  int _currentIndex = 3;

  void _toggleTapState() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Aligns the content vertically centered
        children: <Widget>[
          SizedBox(height: 16),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 181, 144),
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 80,
                    height: 80,
                    child: InkWell(
                      onTap: () {
                        // Handle profile picture tap
                        setState(() {
                          isTapped = !isTapped;
                        });
                      },
                      borderRadius: BorderRadius.circular(40),
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: isTapped ? Colors.green : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Banks and Cards button tap
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child:
                Text('Banks and Cards', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Referral Rewards button tap
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child:
                Text('Referral Rewards', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Help Center button tap
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text('Help Center', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Setting App button tap
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text('Setting App', style: TextStyle(color: Colors.white)),
          ),
          Spacer(),
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}
