import 'package:flutter/material.dart';
import 'package:percobaan_4/kolom14/PoinHelpPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class HelpCenterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Help Center',
//       home: Page(),
//       debugShowCheckedModeBanner: false, // Remove the debug banner
//     );
//   }
// }

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200]!,
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                        builder: (context) =>
                            PoinHelpPage(title: 'Resiko Pemberian Pinjaman'),
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
                        builder: (context) =>
                            PoinHelpPage(title: 'Draft Perjanjian'),
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
                        builder: (context) =>
                            PoinHelpPage(title: 'Informasi Penilaian Risiko'),
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
                        builder: (context) =>
                            PoinHelpPage(title: 'Kebijakan Privasi'),
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
