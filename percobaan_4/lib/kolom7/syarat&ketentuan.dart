import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SyaratKetentuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Syarat & Ketentuan',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                '1. User harus berusia minimal 18 tahun untuk menggunakan aplikasi ini.\n\n'
                '2. User bertanggung jawab atas kebenaran dan kelengkapan informasi yang diberikan dalam proses pendaftaran.\n\n'
                '3. Aplikasi ini hanya diperuntukkan bagi UMKM yang terdaftar secara resmi.\n\n'
                '4. User wajib menjaga kerahasiaan akun dan tidak boleh memberikan akses kepada pihak lain.\n\n'
                '5. User bertanggung jawab penuh atas segala transaksi yang dilakukan melalui aplikasi ini.\n\n'
                '6. Aplikasi ini tidak menjamin hasil investasi dan tidak bertanggung jawab atas kerugian yang mungkin terjadi.\n\n'
                '7. User wajib mematuhi peraturan dan ketentuan yang berlaku dalam penggunaan aplikasi ini.\n\n'
                '8. Aplikasi ini memiliki hak untuk memblokir atau menghapus akun user yang melanggar ketentuan penggunaan.\n\n'
                '9. Syarat dan ketentuan dapat berubah sewaktu-waktu tanpa pemberitahuan sebelumnya.\n\n',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
