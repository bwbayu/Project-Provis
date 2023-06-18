import 'package:flutter/material.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class Portofolio extends StatelessWidget {
  final List<String> umkmImages = [
    'asset/images/umkm_image_1.jpg',
    'asset/images/umkm_image_2.jpg',
    'asset/images/umkm_image_3.jpg',
    'asset/images/umkm_image_4.jpg',
    'asset/images/umkm_image_5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Column myColumn = Column(
      children: [
        Flexible(
          child: SingleChildScrollView(
            child:
                Consumer<PendanaanData>(builder: (context, pendanaan, child) {
              return pendanaan.isLoading
                  ? CircularProgressIndicator()
                  // ignore: unnecessary_null_comparison
                  : pendanaan.listPendanaan != null
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pendanaan.listPendanaan.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Consumer<PinjamanUser>(
                                    builder: (context, pinjaman, child) =>
                                    InkWell(
                                      onTap: () async{
                                        // fetch data umkm
                                        await pinjaman.fetchDataUmkm(pendanaan.listPendanaan[index].pinjaman_id);
                                        Navigator.pushNamed(
                                            context, '/detailPortofolio',
                                            arguments: index);
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
                                                  umkmImages[index % umkmImages.length],
                                                  width: double.infinity,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 20, 0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
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
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              Text(
                                                                'Rp' +
                                                                    pendanaan
                                                                        .listPendanaan[
                                                                            index]
                                                                        .jumlah_pendanaan
                                                                        .toString(),
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
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
                                                                'Status Pendanaan',
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              Text(
                                                                pendanaan
                                                                    .listPendanaan[
                                                                        index]
                                                                    .status_pendanaan,
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
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
                                                                  'Jumlah Pembayaran',
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Rp' +
                                                                      pendanaan
                                                                          .listPendanaan[
                                                                              index]
                                                                          .curr_pembayaran
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
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
                                                                  'Total Pembayaran',
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                                Text(
                                                                  pendanaan
                                                                      .listPendanaan[index]
                                                                      .total_pembayaran.toString(),
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
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
    Column myColumnLunas = Column(
      children: [
        Flexible(
          child: SingleChildScrollView(
            child:
                Consumer<PendanaanData>(builder: (context, pendanaan, child) {
              return pendanaan.isLoading
                  ? CircularProgressIndicator()
                  // ignore: unnecessary_null_comparison
                  : pendanaan.listPendanaanLunas != null
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pendanaan.listPendanaanLunas.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Consumer<PinjamanUser>(
                                    builder: (context, pinjaman, child) =>
                                    InkWell(
                                      onTap: () async{
                                        // fetch data umkm
                                        await pinjaman.fetchDataUmkm(pendanaan.listPendanaanLunas[index].pinjaman_id);
                                        Navigator.pushNamed(
                                            context, '/detailPortofolio',
                                            arguments: index);
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
                                                  umkmImages[index % umkmImages.length],
                                                  width: double.infinity,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 0, 20, 0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
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
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              Text(
                                                                'Rp' +
                                                                    pendanaan
                                                                        .listPendanaanLunas[
                                                                            index]
                                                                        .jumlah_pendanaan
                                                                        .toString(),
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
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
                                                                'Status Pendanaan',
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              Text(
                                                                pendanaan
                                                                    .listPendanaanLunas[
                                                                        index]
                                                                    .status_pendanaan,
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
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
                                                                  'Jumlah Pembayaran',
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Rp' +
                                                                      pendanaan
                                                                          .listPendanaanLunas[
                                                                              index]
                                                                          .curr_pembayaran
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
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
                                                                  'Total Pembayaran',
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w600
                                                                  ),
                                                                ),
                                                                Text(
                                                                  pendanaan
                                                                      .listPendanaanLunas[index]
                                                                      .total_pembayaran.toString(),
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors.black,
                                                                    fontSize: 14,
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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Portofolio',
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
                            child: Consumer<PendanaanData>(
                              builder: (context, pendanaan, child) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(
                                      'Total Portofolio',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Rp' + pendanaan.total_pendanaan.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
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
                        text: "Semua",
                      ),
                      Tab(
                        text: "Selesai",
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
                      myColumnLunas,
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
