import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// test
class tarikDana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200]!,
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
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/TambahRekeningPage');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFCB58F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Tambah Rekening',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Text(
                    'Rekening bank',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF94E3BF),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bank',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 28,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Nama Orang',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '12345678909',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
