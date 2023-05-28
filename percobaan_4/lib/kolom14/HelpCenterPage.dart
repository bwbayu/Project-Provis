import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help Center',
      home: Page(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle back button tap
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bantuan',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.account_circle,
                text: 'FAQ',
                onTap: () {
                  // Handle FAQ button tap
                },
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.payment,
                text: 'Call Center',
                onTap: () {
                  // Handle Call Center button tap
                },
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.security,
                text: 'Resiko Pemberian Pinjaman',
                onTap: () {
                  // Handle Resiko Pemberian Pinjaman button tap
                },
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.language,
                text: 'Draft Perjanjian',
                onTap: () {
                  // Handle Draft Perjanjian button tap
                },
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.settings,
                text: 'Informasi Penilaian Risiko',
                onTap: () {
                  // Handle Informasi Penilaian Risiko button tap
                },
              ),
              SizedBox(height: 16.0),
              HelpButton(
                icon: Icons.help,
                text: 'Kebijakan Privasi',
                onTap: () {
                  // Handle Kebijakan Privasi button tap
                },
              ),
            ],
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
        color: Color.fromARGB(255, 148, 226, 191),
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
