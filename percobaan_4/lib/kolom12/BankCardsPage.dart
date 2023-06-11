import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class BankAndCardsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bank and Cards',
//       home: Page(),
//       debugShowCheckedModeBanner: false, // Remove the debug banner
//     );
//   }
// }

class BankAndCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(
                  'asset/images/vector.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              title: Text(''),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Text(
              'Bank Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle BRI button tap
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.purple[800]!,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'BRI',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Nama',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Nomor Rek',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Add button tap
                Navigator.pushNamed(context, '/TambahRekeningPage');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.purple[800]!,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Tambah Rekening',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool isTapped = false;

//   void _toggleTapState() {
//     setState(() {
//       isTapped = !isTapped;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(45, 41, 96, 1),
//       body: Column(
//         mainAxisAlignment:
//             MainAxisAlignment.center, // Aligns the content vertically centered
//         children: <Widget>[
//           SizedBox(height: 16),
//           Center(
//             child: Container(
//               width: 350,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 253, 181, 144),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'Welcome',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           'Username',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Container(
//                     width: 80,
//                     height: 80,
//                     child: InkWell(
//                       onTap: () {
//                         // Handle profile picture tap
//                         setState(() {
//                           isTapped = !isTapped;
//                         });
//                       },
//                       borderRadius: BorderRadius.circular(40),
//                       child: Icon(
//                         Icons.account_circle,
//                         size: 40,
//                         color: isTapped ? Colors.green : Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Handle Banks and Cards button tap
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(300, 60),
//               backgroundColor: Color.fromARGB(255, 148, 226, 191),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//             child:
//                 Text('Banks and Cards', style: TextStyle(color: Colors.white)),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Handle Referral Rewards button tap
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(300, 60),
//               backgroundColor: Color.fromARGB(255, 148, 226, 191),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//             child:
//                 Text('Referral Rewards', style: TextStyle(color: Colors.white)),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Handle Help Center button tap
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(300, 60),
//               backgroundColor: Color.fromARGB(255, 148, 226, 191),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//             child: Text('Help Center', style: TextStyle(color: Colors.white)),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               // Handle Setting App button tap
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(300, 60),
//               backgroundColor: Color.fromARGB(255, 148, 226, 191),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//             child: Text('Setting App', style: TextStyle(color: Colors.white)),
//           ),
//           Spacer(),
//           BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: 3, // Set the current index of the selected icon
//             selectedItemColor: Colors
//                 .purple, // Set the default color of the active page icon to purple
//             onTap: (index) {
//               // Handle bottom navigation icon tap
//               // Use the index parameter to determine the tapped icon
//             },
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.list),
//                 label: 'List',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_balance_wallet),
//                 label: 'Wallet',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
