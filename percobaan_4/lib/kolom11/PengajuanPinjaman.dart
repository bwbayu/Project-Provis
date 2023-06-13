import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PengajuanPinjamanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: true,
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
                  elevation: 0,
                  actions: [
                    Row(
                      children: [
                        CircleAvatar(child: Text('1')),
                        Transform.rotate(
                          angle: 270.0 *
                              (3.14 /
                                  180.0), // Rotate by 90 degrees as a double value
                          child: SvgPicture.asset(
                            'asset/images/sequence_arrow1.svg',
                          ),
                        ),
                        CircleAvatar(
                          child: Text('2'),
                        ),
                        SizedBox(width: 10), // Add a right gap of 10 pixels
                      ],
                    ),
                  ],
                ),
                Text(
                  'Pengajuan Pinjaman',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Jumlah Pinjaman',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Rp 100000',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Tenor Pinjaman',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    items: ['1 Bulan', '3 Bulan', '6 Bulan', '12 Bulan'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Bunga Pinjaman',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    items: ['5%', '10%'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Frekuensi Angsuran Pokok',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField<String>(
                    items: ['per bulan', 'di akhir tenor'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    dropdownColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Tujuan Pinjaman',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Masukkan Tujuan Pinjaman',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // LANJUT KE LIST PINJAMAN, INFORMASI BANK GA PERLU
                      Navigator.pushNamed(context, '/dashboardUMKM');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 40),
                      backgroundColor: Color.fromARGB(255, 151, 126, 242),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Outfit',
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
