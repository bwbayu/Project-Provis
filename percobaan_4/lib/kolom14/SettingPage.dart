import 'package:flutter/material.dart';
import 'package:percobaan_4/kolom14/PoinHelpPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer2<Login, ProfileData>(
              builder:(context, login, profile, child) =>
              Column(
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
                      'Setting',
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
                  HelpButton(
                    icon: Icons.account_circle,
                    text: 'Update Profile',
                    onTap: () async{
                      // Handle FAQ button tap
                      await profile.fetchData(login.user_id);
                      Navigator.pushNamed(context, '/dataDiri');
                    },
                  ),
                  SizedBox(height: 16.0),
                  if(login.jenis_user == "Borrower")
                    HelpButton(
                      icon: Icons.home_filled,
                      text: 'Update UMKM',
                      onTap: () {
                        // Handle Call Center button tap
                        // Navigator.pushNamed(context, '/CallCenterPage');
                      },
                    ),
                ],
              ),
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
        color: Colors.purple[200]!,
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
