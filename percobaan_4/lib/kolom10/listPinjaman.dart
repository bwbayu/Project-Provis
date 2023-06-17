import 'package:flutter/material.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class listPinjaman extends StatelessWidget {
  final List<String> umkmImages = [
    'asset/images/umkm_image_5.jpg',
    'asset/images/umkm_image_3.jpg',
    'asset/images/umkm_image_2.jpg',
    'asset/images/umkm_image_1.jpg',
    'asset/images/umkm_image_4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Column myColumn = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: ElevatedButton(
            onPressed: () {
              // BUTTON AJUKAN PINJAMAN
              Navigator.pushNamed(context, '/PengajuanPinjamanPage');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.zero,
            ),
            child: ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.black,
              ),
              title: Text(
                'Ajukan Pinjaman',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                ),
              ),
              dense: false,
              contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Consumer<PinjamanUser>(builder: (context, pinjaman, child) {
              return pinjaman.isLoading
                  ? CircularProgressIndicator()
                  : pinjaman.pinjamanList != null
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pinjaman.pinjamanList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Random random = Random();
                                  final int randomIndex = random.nextInt(5);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/rincianPinjaman', arguments: index,);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                umkmImages[randomIndex],
                                                width: double.infinity,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    151,
                                                                    126,
                                                                    242,
                                                                    1),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 0),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                              children: [
                                                                                Text(
                                                                                  'Total Pendanaan',
                                                                                  style:
                                                                                      TextStyle(
                                                                                    fontFamily:
                                                                                        'Outfit',
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                    color: Colors
                                                                                        .white,
                                                                                    fontSize:
                                                                                        14,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Rp'+pinjaman.pinjamanList![index].jumlah_pinjaman.toString(),
                                                                                  style:
                                                                                      TextStyle(
                                                                                    fontFamily:
                                                                                        'Outfit',
                                                                                    fontWeight:
                                                                                        FontWeight.w500,
                                                                                    color: Colors
                                                                                        .white,
                                                                                    fontSize:
                                                                                        14,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment
                                                                                      .center,
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                              children: [
                                                                                Text(
                                                                                  'Pendanaan Terkumpul',
                                                                                  style:
                                                                                      TextStyle(
                                                                                    fontFamily:
                                                                                        'Outfit',
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                    color: Colors
                                                                                        .white,
                                                                                    fontSize:
                                                                                        14,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Rp'+pinjaman.pinjamanList![index].pinjaman_terkumpul.toString(),
                                                                                  style:
                                                                                      TextStyle(
                                                                                    fontFamily:
                                                                                        'Outfit',
                                                                                    fontWeight:
                                                                                        FontWeight.w500,
                                                                                    color: Colors
                                                                                        .white,
                                                                                    fontSize:
                                                                                        14,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                                  child: Row(
                                                                    children: [
                                                                      Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment
                                                                                    .center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment
                                                                                    .start,
                                                                            children: [
                                                                              Text(
                                                                                'Status Pendanaan',
                                                                                style:
                                                                                    TextStyle(
                                                                                  fontFamily:
                                                                                      'Outfit',
                                                                                  fontWeight:
                                                                                      FontWeight.w600,
                                                                                  color: Colors
                                                                                      .white,
                                                                                  fontSize:
                                                                                      14,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                pinjaman.pinjamanList![index].status_pinjaman,
                                                                                style:
                                                                                    TextStyle(
                                                                                  fontFamily:
                                                                                      'Outfit',
                                                                                  fontWeight:
                                                                                      FontWeight.w500,
                                                                                  color: Colors
                                                                                      .white,
                                                                                  fontSize:
                                                                                      14,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                    ],
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
                                },
                              ),
                            ),
                          ],
                        )
                      : SizedBox();
            }),
          ),
        ),
      ],
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Pinjaman',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(151, 126, 242, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    'Total Pinjaman',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Consumer<PinjamanUser>(
                                  builder: (context, pinjaman, child) =>
                                  Text(
                                    'Rp'+ pinjaman.total_pinjaman.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Terbaru",
                      ),
                      Tab(
                        text: "Selesai",
                      ),
                      Tab(
                        text: "Semua",
                      ),
                    ],
                    labelStyle: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      myColumn,
                      myColumn,
                      myColumn,
                    ],
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
