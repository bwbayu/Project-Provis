import 'package:flutter/material.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class listUMKM extends StatelessWidget {
  final List<String> umkmImages = [
    'asset/images/umkm_image_5.jpg',
    'asset/images/umkm_image_4.jpg',
    'asset/images/umkm_image_3.jpg',
    'asset/images/umkm_image_2.jpg',
    'asset/images/umkm_image_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                title: Text(
                  'List UMKM',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 0,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Consumer<PinjamanUser>(
                      builder: (context, pinjaman, child) {
                    return pinjaman.isLoading1
                        ? CircularProgressIndicator()
                        : pinjaman.listPinjamanOpen != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          pinjaman.listPinjamanOpen!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () async {
                                            final statusCode = await pinjaman
                                                .fetchDataUmkm(pinjaman
                                                    .listPinjamanOpen![index]
                                                    .pinjaman_id);
                                            if (statusCode == 200) {
                                              Navigator.pushNamed(
                                                  context, '/UMKMPage',
                                                  arguments: index);
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 20, 20),
                                            child: Container(
                                              width: double.infinity,
                                              height: 200,
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      umkmImages[index %
                                                          umkmImages.length],
                                                      width: double.infinity,
                                                      height: 120,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              20, 0, 20, 0),
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
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Rp' +
                                                                    pinjaman
                                                                        .listPinjamanOpen![
                                                                            index]
                                                                        .jumlah_pinjaman
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .black,
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
                                                                'Pendanaan Terkumpul',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Rp' +
                                                                    pinjaman
                                                                        .listPinjamanOpen![
                                                                            index]
                                                                        .pinjaman_terkumpul
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
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
          ),
        ),
      ),
    );
  }
}
