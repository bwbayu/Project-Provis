import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TarikTunaiPage(),
    );
  }
}

class TarikTunaiPage extends StatefulWidget {
  @override
  _TarikTunaiPageState createState() => _TarikTunaiPageState();
}

class _TarikTunaiPageState extends State<TarikTunaiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showPopup() {
    _animationController.forward();
  }

  void _hidePopup() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "asset/images/backgroundpolos.png", // Background image
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
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
                  title: Text(
                    'Tarik Dana',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        width: 350, // lebar kontainer
                        height: 200, // tinggi kontainer

                        child: Image.asset(
                          'asset/images/tarikdana.png',
                          fit: BoxFit
                              .cover, // atur ukuran gambar sesuai ukuran kontainer
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Metode Pembayaran: ',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: 'BCA',
                                  onChanged: (newValue) {
                                    // Tangani perubahan nilai dropdown
                                  },
                                  items:
                                      ['BCA', 'BNI', 'BRI'].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        width: 100, // lebar kontainer
                                        height: 100,
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.orangeAccent,
                                            ),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Rp10.000.000,00',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    'Pilih Nominal',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp10.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp20.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp50.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp100.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp200.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                                _showPopup();
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.orangeAccent, // Warna latar belakang
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Center(
                                  child: Text(
                                    'Rp500.000,00',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                      _showPopup();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent, // Warna latar belakang
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: Text(
                          'Jumlah Lainnya',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Expanded(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 16),
                //       child: ElevatedButton(
                //         onPressed: () {
                //           // Handle button press
                //           _showPopup();
                //         },
                //         style: ElevatedButton.styleFrom(
                //           primary: Colors.orangeAccent, // Warna latar belakang
                //         ),
                //         child: SizedBox(
                //           width: double.infinity,
                //           height: 100,
                //           child: Center(
                //             child: Text(
                //               'Jumlah Lainnya',
                //               style: TextStyle(
                //                 fontFamily: 'Outfit',
                //                 fontWeight: FontWeight.w700,
                //                 color: Colors.white,
                //                 fontSize: 18,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: _animation.value,
                        child: Container(
                          height: _animation.value * 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Konfirmasi Tarik Tunai',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Apakah Anda yakin ingin menarik tunai sebesar Rp10.000,00?',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement confirmation button logic
                                },
                                child: Text('Konfirmasi'),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _hidePopup();
                                },
                                child: Text('Batal'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
