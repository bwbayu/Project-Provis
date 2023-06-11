import 'package:flutter/material.dart';

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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: umkmImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                // Aksi ketika item diklik
                                // Contoh aksi: Tampilkan detail pinjaman
                                Navigator.pushNamed(context, '/UMKMPage');
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          umkmImages[index],
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
                                              EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Total Pinjaman',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Rp15.000.000,00',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Status Pinjaman',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.black,
                                                  fontSize: 14,
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
