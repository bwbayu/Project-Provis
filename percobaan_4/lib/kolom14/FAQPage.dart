import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.jpg"),
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
                    'FAQ',
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
                // TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     hintText: 'Search',
                //     contentPadding: EdgeInsets.all(8.0),
                //     prefixIcon: Icon(Icons.search),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20.0),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16.0),
                SizedBox(height: 32.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _data.map<Widget>((Item item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: ExpansionPanelList(
                              expansionCallback: (int index, bool isExpanded) {
                                setState(() {
                                  item.isExpanded = !isExpanded;
                                });
                              },
                              children: [
                                ExpansionPanel(
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        item.headerValue,
                                        style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  },
                                  body: ListTile(
                                    title: Text(
                                      item.expandedValue,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                  ),
                                  isExpanded: item.isExpanded,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
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

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    if (index == 0) {
      return Item(
        headerValue: 'Bagaimana cara mengajukan pinjaman?',
        expandedValue:
            'Anda dapat mengajukan pinjaman melalui aplikasi kami dengan mengisi formulir pengajuan dan mengirimkan dokumen yang diperlukan',
      );
    } else if (index == 1) {
      return Item(
        headerValue: 'Berapa lama proses persetujuan pinjaman?',
        expandedValue:
            'Proses persetujuan pinjaman biasanya memakan waktu 1-2 hari kerja setelah Anda mengajukan permohonan dan melengkapi persyaratan.',
      );
    } else if (index == 2) {
      return Item(
        headerValue: 'Apakah saya perlu jaminan untuk mendapatkan pinjaman?',
        expandedValue:
            'Tergantung pada jenis pinjaman, ada beberapa produk pinjaman yang membutuhkan jaminan dan ada juga yang tidak memerlukannya. Informasi lebih lanjut dapat ditemukan di aplikasi kami.',
      );
    } else if (index == 3) {
      return Item(
        headerValue: 'Apakah ada biaya tersembunyi dalam pinjaman?',
        expandedValue:
            ' Tidak, kami tidak mengenakan biaya tersembunyi dalam pinjaman. Semua biaya dan suku bunga akan dijelaskan secara transparan sebelum Anda menyetujui pinjaman.',
      );
    } else if (index == 4) {
      return Item(
        headerValue: 'Bagaimana cara melacak status pinjaman saya?',
        expandedValue:
            'Anda dapat melacak status pinjaman Anda melalui aplikasi kami. Setelah masuk, Anda akan melihat update terkait persetujuan dan status pembayaran.',
      );
    } else if (index == 5) {
      return Item(
        headerValue:
            'Apa yang terjadi jika saya melewatkan pembayaran pinjaman?',
        expandedValue:
            'Jika Anda melewatkan pembayaran, Anda mungkin akan dikenakan denda keterlambatan. Penting untuk menghubungi tim layanan pelanggan kami untuk mengatur pembayaran yang tertunda.',
      );
    } else if (index == 6) {
      return Item(
        headerValue: 'Bagaimana keamanan data pribadi saya dijamin?',
        expandedValue:
            'Kami mengambil langkah-langkah keamanan yang ketat untuk melindungi data pribadi Anda. Informasi Anda akan dijaga kerahasiaannya dan digunakan sesuai dengan kebijakan privasi kami.',
      );
    } else if (index == 7) {
      return Item(
        headerValue: 'Bisakah saya melunasi pinjaman lebih awal?',
        expandedValue:
            'Ya, Anda dapat melunasi pinjaman lebih awal. Namun, mungkin ada biaya penalti atau kebijakan tertentu yang berlaku. Pastikan untuk membaca ketentuan pinjaman sebelumnya.',
      );
    } else if (index == 8) {
      return Item(
        headerValue:
            'Bagaimana jika saya mengalami kesulitan membayar pinjaman?',
        expandedValue:
            'Jika Anda mengalami kesulitan membayar pinjaman, segera hubungi tim layanan pelanggan kami. Kami dapat membantu mencari solusi yang sesuai dengan situasi keuangan Anda.',
      );
    } else {
      return Item(
        headerValue:
            'Bisakah saya mengajukan pinjaman lebih dari satu sekaligus?',
        expandedValue:
            'Kebijakan mengenai jumlah pinjaman yang dapat diajukan bergantung pada peraturan dan kebijakan internal kami. Silakan periksa aplikasi kami untuk informasi lebih lanjut.',
      );
    }
  });
}
