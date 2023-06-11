import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoinHelpPage extends StatelessWidget {
  const PoinHelpPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, sapien ut imperdiet gravida, dui ex tristique odio, vel semper sapien turpis a lectus. Vestibulum vel quam elit. Sed in tellus libero. Etiam et elit varius, efficitur turpis vel, lobortis mi. Duis suscipit, eros vel bibendum malesuada, massa nulla consectetur ante, a sollicitudin purus dolor a felis. Vestibulum finibus nibh ac eros maximus, nec viverra dolor consequat. Nulla facilisi. Nunc interdum, risus non lobortis bibendum, mi nunc accumsan sapien, a tincidunt tellus augue sed orci. Fusce eget felis eu eros eleifend luctus quis in odio. Nam faucibus, ipsum quis gravida feugiat, arcu lacus dignissim sapien, vel bibendum massa tortor in mauris. Suspendisse euismod ante nulla, vel semper metus interdum non.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Outfit',
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
