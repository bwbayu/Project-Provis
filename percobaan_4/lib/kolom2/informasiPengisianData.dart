import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

// 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Tubes',
      home: Scaffold(
        backgroundColor: Color(0xFF2E2960),
        appBar: AppBar(
          backgroundColor: Color(0xFF2E2960),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
            },
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 10, 10, 0),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF2D2960),
                    ),
                    child: ListTile(
                        title: Text(
                          'Mulai Pengisian Data',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFFF7F8F9),
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text(
                          'Sebelum melanjutkan pengisian data, mohon siapkan dokumen berikut untuk memudahkan pengisian data Anda.',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFF2F5F8),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        tileColor: Color(0xFF2D2960)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Button pressed callback
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xFF2D2960),
                      padding: EdgeInsets.zero,
                    ),
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.solidIdCard,
                        size: 50,
                        color: Color(0xFFF7F8F9),
                      ),
                      title: Text(
                        'KTP',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFFF7F8F9),
                          fontSize: 25,
                        ),
                      ),
                      subtitle: Text(
                        'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFF2F5F8),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Button pressed callback
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xFF2D2960),
                      padding: EdgeInsets.zero,
                    ),
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.solidIdCard,
                        size: 50,
                        color: Color(0xFFF7F8F9),
                      ),
                      title: Text(
                        'KTP',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFFF7F8F9),
                          fontSize: 25,
                        ),
                      ),
                      subtitle: Text(
                        'Gunakan e-ktp ataupun Surat Keterangan Pengganti (SKP) KTP untuk mendaftar',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFFF2F5F8),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2960),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 10, 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Lanjutkan',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF977EF2),
                            textStyle: TextStyle(fontSize: 16),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //Material APP
  }
}
