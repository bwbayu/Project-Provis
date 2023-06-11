import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class UmkmDash extends StatelessWidget {
  final List<String> umkmImages = [
    'asset/images/umkm_image_1.jpg',
    'asset/images/umkm_image_2.jpg',
    'asset/images/umkm_image_3.jpg',
    'asset/images/umkm_image_4.jpg',
    'asset/images/umkm_image_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height - 250,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage("asset/images/backgroundsaldo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('asset/images/avatar.jpeg'),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Consumer<Login>(
                              builder: (context, login, child) => Text(
                                login.email,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        NotificationButton(),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 15.0),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Consumer<Wallet>(
                                        builder: (context, wallet, child) =>
                                            Text(
                                          "Rp. " + wallet.saldo.toString(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      // Tambahkan widget lainnya di sini jika diperlukan
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color.fromARGB(
                                                255, 240, 240, 240),
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                'asset/images/topup.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                color: Color.fromARGB(
                                                    1000, 168, 81, 223),
                                              ),
                                              onPressed: () {
                                                // Handle Isi Dana button tap
                                                Navigator.pushNamed(
                                                    context, '/isiDana');
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Top Up Saldo',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color.fromARGB(
                                                255, 240, 240, 240),
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                'asset/images/transfer.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                color: Color.fromARGB(
                                                    1000, 168, 81, 223),
                                              ),
                                              onPressed: () {
                                                // Handle Transfer button tap
                                                Navigator.pushNamed(
                                                    context, '/tarikDana');
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Transfer',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color.fromARGB(
                                                255, 240, 240, 240),
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                'asset/images/card.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                color: Color.fromARGB(
                                                    1000, 168, 81, 223),
                                              ),
                                              onPressed: () {
                                                // Handle Request button tap
                                                // Navigator.pushNamed(context, '/request');
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'Card',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color.fromARGB(
                                                255, 240, 240, 240),
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                'asset/images/history.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                color: Color.fromARGB(
                                                    1000, 168, 81, 223),
                                              ),
                                              onPressed: () {
                                                // Handle History button tap
                                                // Navigator.pushNamed(context, '/history');
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'History',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Verifikasi Akun button tap
                                Navigator.pushNamed(context, '/formVerifikasi');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(151, 126, 242, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Verifikasi Akun',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Trending Pendanaan',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
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
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/UMKMPage');
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
                                                color: Color.fromRGBO(
                                                    151, 126, 242, 1),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
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
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Rp2.500.00,00',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Text(
                                                    //   'Status Pendanaan',
                                                    //   style: TextStyle(
                                                    //     fontFamily:
                                                    //         'Readex Pro',
                                                    //     color: Colors.black,
                                                    //     fontSize: 14,
                                                    //   ),
                                                    // ),
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
          ],
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Handle notification options
        if (value == 'option1') {
          // Perform action for option 1
        } else if (value == 'option2') {
          // Perform action for option 2
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'option1',
          child: Container(
            width: 200, // Adjust the width to your preference
            child: Text('Halo Selamat Datang di Aplikasi DAUS'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: Container(
            width: 200, // Adjust the width to your preference
            child: Text('Hello Welcome to DAUS'),
          ),
        ),
      ],
      child: Icon(
        Icons.notifications,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
