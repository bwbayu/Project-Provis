import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Carousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarouselExample(),
    );
  }
}

class CarouselExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Carousel'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // Aksi ketika item diklik
                    // Contoh aksi: Tampilkan halaman lain
                    Navigator.pushNamed(context, '/HalamanLain');
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      )),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
