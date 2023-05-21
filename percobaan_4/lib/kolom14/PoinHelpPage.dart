import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poin Help',
      home: PoinHelpPage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class PoinHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2960),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              IconButton(
                onPressed: () {
                  // Handle back button tap
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              SizedBox(height: 8.0),
              Text(
                'Risiko Pemberian Pinjaman',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, sapien ut imperdiet gravida, dui ex tristique odio, vel semper sapien turpis a lectus. Vestibulum vel quam elit. Sed in tellus libero. Etiam et elit varius, efficitur turpis vel, lobortis mi. Duis suscipit, eros vel bibendum malesuada, massa nulla consectetur ante, a sollicitudin purus dolor a felis. Vestibulum finibus nibh ac eros maximus, nec viverra dolor consequat. Nulla facilisi. Nunc interdum, risus non lobortis bibendum, mi nunc accumsan sapien, a tincidunt tellus augue sed orci. Fusce eget felis eu eros eleifend luctus quis in odio. Nam faucibus, ipsum quis gravida feugiat, arcu lacus dignissim sapien, vel bibendum massa tortor in mauris. Suspendisse euismod ante nulla, vel semper metus interdum non.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
