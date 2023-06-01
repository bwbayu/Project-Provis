import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
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
            child: InkWell(
              onTap: () {
                // Handle the container tap here
                Navigator.pushNamed(context, '/dataAkun');
              },
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
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Banks and Cards button tap
              Navigator.pushNamed(context, '/BankAndCardsPage');
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
              Navigator.pushNamed(context, '/HelpCenterPage');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child:
                Text('Help Center', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Help Center button tap
              // Navigator.pushNamed(context, '/SettingPage');
              
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
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Setting App button tap
              Navigator.pushNamed(context, '/welcomePage');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              backgroundColor: Color.fromARGB(255, 148, 226, 191),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
