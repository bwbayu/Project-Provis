import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class InformasiAkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Consumer<ProfileData>(
              builder: (context, profile, child) => Column(
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
                    title: Text(''),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Consumer<ProfileData>(
                          builder: (context, profile, child) {
                            String? img = profile.foto_ktp;
                            return CircleAvatar(
                              radius: 40,
                              backgroundImage: img != ""
                                  ? AssetImage('asset/images/$img')
                                  : AssetImage('asset/images/avatar.jpeg'),
                            );
                          },
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
                            subtitle: Text(profile.nama),
                          ),
                          ListTile(
                            title: Text('Tempat Lahir',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.tempat_lahir),
                          ),
                          ListTile(
                            title: Text('Tanggal Lahir',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.tgl_lahir),
                          ),
                          ListTile(
                            title: Text('Jenis Kelamin',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.jenis_kelamin),
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
                            subtitle: Text(profile.status_kewarganegaraan),
                          ),
                          ListTile(
                            title: Text('Alamat Lengkap',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.alamat),
                          ),
                          ListTile(
                            title: Text('Provinsi',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.provinsi),
                          ),
                          ListTile(
                            title: Text('Kabupaten/kota',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.kabkota),
                          ),
                          ListTile(
                            title: Text('Kecamatan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.kecamatan),
                          ),
                          ListTile(
                            title: Text('Kelurahan',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.kelurahan),
                          ),
                          ListTile(
                            title: Text('RT/RW',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.rtrw),
                          ),
                          ListTile(
                            title: Text('Kode Pos',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(profile.kodepos),
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
      ),
    );
  }
}
