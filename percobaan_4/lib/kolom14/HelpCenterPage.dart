import 'package:flutter/material.dart';
import 'package:percobaan_4/kolom14/PoinHelpPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                  title: Text(
                    'Bantuan',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.account_circle,
                  text: 'FAQ',
                  onTap: () {
                    // Handle FAQ button tap
                    Navigator.pushNamed(context, '/FAQPage');
                  },
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.payment,
                  text: 'Call Center',
                  onTap: () {
                    // Handle Call Center button tap
                    Navigator.pushNamed(context, '/CallCenterPage');
                  },
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.security,
                  text: 'Resiko Pemberian Pinjaman',
                  onTap: () {
                    // Handle Resiko Pemberian Pinjaman button tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoinHelpPage(
                          title: 'Resiko Pemberian Pinjaman',
                          text:
                              'Pemberian pinjaman melalui aplikasi P2P lending untuk UMKM memiliki beberapa risiko yang perlu dipertimbangkan sebelum Anda memutuskan untuk mengajukan pinjaman. Meskipun aplikasi P2P lending dapat memberikan akses ke dana dengan cepat dan mudah, ada beberapa hal yang perlu diperhatikan:\n\n1. Risiko Kredit: Setiap pinjaman memiliki risiko kredit, di mana peminjam mungkin tidak dapat membayar kembali pinjaman sesuai dengan kesepakatan...\n\nPenting untuk menyadari dan memahami risiko-risiko tersebut sebelum memutuskan untuk menggunakan aplikasi P2P lending. Pertimbangkan baik-baik kebutuhan dan kemampuan Anda sebagai peminjam sebelum membuat keputusan pinjaman yang bijaksana. Selalu konsultasikan dengan ahli keuangan atau penasihat hukum jika diperlukan untuk mendapatkan nasihat yang tepat.',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.language,
                  text: 'Draft Perjanjian',
                  onTap: () {
                    // Handle Draft Perjanjian button tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoinHelpPage(
                          title: 'Draft Perjanjian',
                          text:
                              'Draft Perjanjian adalah dokumen penting dalam pemberian pinjaman melalui aplikasi P2P lending untuk UMKM. Perjanjian ini akan memuat ketentuan-ketentuan antara pemberi pinjaman dan penerima pinjaman yang mengatur hak dan kewajiban kedua belah pihak.\n\nDalam draft perjanjian, biasanya akan dijelaskan mengenai jumlah pinjaman, suku bunga, jangka waktu pinjaman, jaminan yang diberikan (jika ada), serta ketentuan-ketentuan lain yang relevan.\n\nPenting untuk membaca dan memahami draft perjanjian secara seksama sebelum menandatanganinya. Pastikan Anda mengerti semua ketentuan yang tercantum dan jika diperlukan, konsultasikan dengan ahli hukum atau penasihat keuangan sebelum menyetujui perjanjian tersebut.',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.settings,
                  text: 'Informasi Penilaian Risiko',
                  onTap: () {
                    // Handle Informasi Penilaian Risiko button tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoinHelpPage(
                          title: 'Informasi Penilaian Risiko',
                          text:
                              'Informasi Penilaian Risiko merupakan bagian penting dalam aplikasi P2P lending untuk UMKM. Proses ini dilakukan untuk mengevaluasi risiko kredit dan keberlanjutan bisnis penerima pinjaman sebelum pinjaman disetujui.\n\nDalam penilaian risiko, beberapa faktor yang diperhatikan meliputi kondisi keuangan UMKM, sektor usaha, riwayat kredit, dan informasi lainnya yang relevan. Penilaian risiko ini bertujuan untuk memastikan bahwa penerima pinjaman memiliki kemampuan yang memadai untuk melunasi pinjaman sesuai dengan kesepakatan.\n\nPenting untuk memahami bahwa penilaian risiko tidak dapat menjamin sepenuhnya keberhasilan pinjaman. Namun, proses ini membantu dalam mengurangi risiko default dan meningkatkan kepercayaan dalam aplikasi P2P lending.',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                HelpButton(
                  icon: Icons.help,
                  text: 'Kebijakan Privasi',
                  onTap: () {
                    // Handle Kebijakan Privasi button tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoinHelpPage(
                          title: 'Kebijakan Privasi',
                          text:
                              'Kebijakan Privasi adalah dokumen yang menjelaskan bagaimana informasi pribadi pengguna dihimpun, digunakan, dan dilindungi oleh aplikasi P2P lending untuk UMKM. Kebijakan Privasi ini bertujuan untuk memberikan pemahaman kepada pengguna mengenai penggunaan dan perlindungan data pribadi mereka.\n\nDalam kebijakan privasi, biasanya dijelaskan jenis informasi yang dikumpulkan, cara penggunaan informasi tersebut, pihak ketiga yang mungkin memiliki akses ke informasi, tindakan keamanan yang diimplementasikan, dan hak-hak pengguna terkait privasi mereka.\n\nPenting untuk membaca dan memahami kebijakan privasi dengan seksama sebelum menggunakan aplikasi P2P lending. Pastikan Anda mengerti bagaimana data pribadi Anda akan dikelola dan dilindungi oleh aplikasi.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const HelpButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[200]!,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
