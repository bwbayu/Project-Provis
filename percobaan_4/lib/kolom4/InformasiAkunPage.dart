import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformasiAkunPage extends StatelessWidget {
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
      body: SafeArea(
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
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('asset/images/avatar.jpeg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Profile Photo',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        ListTile(
                          title: Text('Nama',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Budi Jonathan'),
                        ),
                        ListTile(
                          title: Text('Tempat Lahir',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Jakarta'),
                        ),
                        ListTile(
                          title: Text('Tanggal Lahir',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('02-03-2010'),
                        ),
                        ListTile(
                          title: Text('Jenis Kelamin',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Pria'),
                        ),
                        ListTile(
                          title: Text('Kategori Usaha',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Menengah'),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        ListTile(
                          title: Text('Status Kewarganegaraan',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Indonesia'),
                        ),
                        ListTile(
                          title: Text('Alamat Lengkap',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Jalan Mangga Besar III No. 17'),
                        ),
                        ListTile(
                          title: Text('Provinsi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Jawa Timur'),
                        ),
                        ListTile(
                          title: Text('Kabupaten/kota',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Malang'),
                        ),
                        ListTile(
                          title: Text('Kecamatan',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Lawang'),
                        ),
                        ListTile(
                          title: Text('Kelurahan',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Bedali'),
                        ),
                        ListTile(
                          title: Text('RT/RW',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('06/07'),
                        ),
                        ListTile(
                          title: Text('Kode Pos',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('60256'),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
