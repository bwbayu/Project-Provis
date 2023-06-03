import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class akunBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple[200]!,
              Colors.purple[800]!,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Akun Bank',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Rekening yang Anda input akan digunakan untuk penarikan dana Anda.',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8.0),
                    Card(
                        child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(children: [
                              DropdownButtonFormField<String>(
                                  items: ['Bank A', 'Bank B', 'Bank C']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: new Text(value));
                                  }).toList(),
                                  onChanged: (value) {},
                                  decoration:
                                      InputDecoration(labelText: 'Nama Bank')),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Nama Pemilik Akun'),
                                  style: TextStyle(color: Colors.black)),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Nomor Rekening'),
                                  style: TextStyle(color: Colors.black))
                            ])))
                  ],
                )),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/dashboardInvestor');
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF977EF2),
                      textStyle: TextStyle(fontSize: 16),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
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
        ),
      ),
    );
  }
}
