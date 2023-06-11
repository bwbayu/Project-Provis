import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class SyaratKetentuan extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'New Page',
//       theme: ThemeData(primarySwatch: Colors.purple),
//       home: NewPage(),
//     );
//   }
// }

class SyaratKetentuan extends StatelessWidget {
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
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi.',
                style: TextStyle(fontFamily: 'Outfit', color: Colors.white)),
          )
        ],
      ),
    ));
  }
}
