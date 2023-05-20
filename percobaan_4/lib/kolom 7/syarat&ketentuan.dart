import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Page',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: NewPage(),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple[200]!,
                Colors.purple[800]!,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Syarat & Ketentuan',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi. Sed euismod, justo vel fringilla tincidunt, sapien velit ultricies velit, vel luctus diam magna non nisl. Nulla facilisi.',
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ));
  }
}
