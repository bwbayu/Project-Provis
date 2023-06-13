import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class DataIdentitasUMKM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Consumer2<UmkmProvider, Login>(
              builder: (context, umkm, login, child) => Column(
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
                            backgroundColor: Color.fromARGB(255, 146, 143, 146),
                            child: Text('2'),
                          ),
                          SizedBox(width: 10), // Add a right gap of 10 pixels
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Lengkapi Data Usaha',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Bentuk UMKM',
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonFormField<String>(
                      items:
                          ['Rendah', 'Menengah', 'Tinggi'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        umkm.bentuk_umkm = value!;
                      },
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
                    'Jumlah Karyawan',
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
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '1',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      onChanged: (value) {
                        umkm.jumlah_karyawan = int.parse(value);
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Kontak UMKM',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '+62',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      onChanged: (value) => umkm.kontak_umkm = value,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Kategori Usaha',
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonFormField<String>(
                      items: ['Kecil', 'Medium', 'Large'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        umkm.kategori_umkm = value!;
                      },
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
                    'Omset Bulanan',
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
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '1 juta',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      onChanged: (value) =>
                          umkm.omset_bulanan = double.parse(value),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    'Nama Usaha/Toko',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Cek Toko Sebelah',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      onChanged: (value) => umkm.nama_umkm = value,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Alamat Usaha/Toko',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Tokopedia/Shopee',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      onChanged: (value) => umkm.alamat_umkm = value,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Deskripsi Usaha/Toko',
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
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Teknisi',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 110, 109, 109)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                      ),
                      onChanged: (value) => umkm.deskripsi_umkm = value,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button tap
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Unggah Foto',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () async{
                        // LANJUT KE PENGAJUAN PINJAMAN
                        // post data umkm
                        final statusCode = await umkm.addUmkm(login.user_id);
                        print(statusCode);
                        if (statusCode == 200) {
                          Navigator.pushNamed(
                              context, '/PengajuanPinjamanPage');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: Add umkm failed.'),
                            ),
                          );
                        }
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
                          fontFamily: 'Outfit',
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
      ),
    );
  }
}
