import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: ElevatedButton(
            onPressed: () {
              // BUTTON AJUKAN PINJAMAN
              Navigator.pushNamed(context, '/DataIdentitasUMKM');
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
                          Navigator.pushNamed(context, '/rincianPinjaman');
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                                fontFamily: 'Readex Pro',
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Rp20.000.000,00',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Status Pinjaman',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
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
                  height: 180,
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
                                Text(
                                  'Rp20.000.000,00',
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Pinjaman Aktif',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rp20.000.000,00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pinjaman on process',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rp20.000.000,00',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 20,
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
