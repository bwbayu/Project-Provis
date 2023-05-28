import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformasiBankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Back button action
                  },
                  icon: SvgPicture.asset(
                    'asset/images/vector.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                Spacer(),
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
                    CircleAvatar(child: Text('2')),
                    Transform.rotate(
                      angle: 270.0 *
                          (3.14 /
                              180.0), // Rotate by 90 degrees as a double value
                      child: SvgPicture.asset(
                        'asset/images/sequence_arrow1.svg',
                      ),
                    ),
                    CircleAvatar(child: Text('3')),
                  ],
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
            child: Text(
              'Informasi Bank',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
            child: Text(
              'Nama Bank',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              items: ['BNI', 'BCA', 'BRI'].map((String value) {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
            child: Text(
              'Nomor Rekening',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your account number',
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
            child: Text(
              'Nama Pemilik Rekening',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter the account owner name',
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 151, 126, 242),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Lanjutkan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
