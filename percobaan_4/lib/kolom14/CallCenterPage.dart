import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
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
                Text(
                  'Kontak Kami',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        ListTile(
                          title: Text('Email',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('customer.service@xyz.com'),
                        ),
                        ListTile(
                          title: Text('Telepon',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('0800-123-4567'),
                        ),
                        ListTile(
                          title: Text('Waktu Operasional',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Senin - Jumat 09:00 - 18:00\nTidak termasuk hari libur nasional'),
                        ),
                        ListTile(
                          title: Text('Alamat',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Jalan Jendral Sudirman No. 123, Jakarta, 3432'),
                        ),
                      ]),
                    ),
                  ),
                ),
                Text(
                  'Layanan Pengaduan',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Silakan masukkan nama Anda",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email@email.com",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Silakan masukkan nomor Anda",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jenis Keluhan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    items: ['Satu', 'Dua', 'Tiga'].map((String value) {
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
                SizedBox(height: 10),
                Text(
                  'Saran dan Kritik',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Pendapat Anda berharga",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle Lanjutkan button tap
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    backgroundColor: Color.fromARGB(255, 151, 126, 242),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
