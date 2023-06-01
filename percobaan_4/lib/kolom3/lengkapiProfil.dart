import 'package:flutter/material.dart';

class formVerifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2E2961),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Lengkapi Profil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Mohon lengkapi data dibawah ini',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Informasi Akun Kamu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/dataDiri');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 4.0,
                        ),
                        SizedBox(width: 8.0),
                        Text('Data Diri',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/formData');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 4.0,
                        ),
                        SizedBox(width: 8.0),
                        Text('Dokumen', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/akunBank');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 4.0,
                        ),
                        SizedBox(width: 8.0),
                        Text('Akun Bank',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/formTTD');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 4.0,
                        ),
                        SizedBox(width: 8.0),
                        Text('Tanda tangan',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/dashboardInvestor');
                    Navigator.pushNamed(context, '/dashboardUMKM');
                  },
                  child:
                      Text('Lanjutkan', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF977EF2)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Complete Profile',
//       home: Scaffold(
//         backgroundColor: Color(0xFF2E2961),
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {},
//           ),
//           title: Text(''),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     'Lengkapi Profil',
//                     style: GoogleFonts.outfit(
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     'Mohon lengkapi data dibawah ini',
//                     style: GoogleFonts.outfit(
//                       textStyle: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   Text(
//                     'Informasi Akun Kamu',
//                     style: GoogleFonts.outfit(
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.black,
//                           radius: 4.0,
//                         ),
//                         SizedBox(width: 8.0),
//                         Text(
//                           'Data Diri',
//                           style: GoogleFonts.outfit(
//                             textStyle: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 32.0,
//                         vertical: 16.0,
//                       ),
//                       shape: RoundedRectangleBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.black,
//                           radius: 4.0,
//                         ),
//                         SizedBox(width: 8.0),
//                         Text(
//                           'Akun Bank',
//                           style: GoogleFonts.outfit(
//                             textStyle: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 32.0,
//                         vertical: 16.0,
//                       ),
//                       shape: RoundedRectangleBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 8.0),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.black,
//                           radius: 4.0,
//                         ),
//                         SizedBox(width: 8.0),
//                         Text(
//                           'Tanda tangan',
//                           style: GoogleFonts.outfit(
//                             textStyle: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 32.0,
//                         vertical: 16.0,
//                       ),
//                       shape: RoundedRectangleBorder(),
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Lanjutkan',
//                     style: GoogleFonts.outfit(
//                       textStyle: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xFF977EF2),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

