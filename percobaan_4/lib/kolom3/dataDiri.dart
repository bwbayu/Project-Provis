import 'package:flutter/material.dart';

class dataDiri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Diri',
      home: Scaffold(
        backgroundColor: Color(0xFF2E2961),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Identitas Kamu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Mohon pastikan data dibawah ini sesuai dengan KTP kamu.',
                    style: TextStyle(color: Colors.white),
                  ),
                  // SizedBox(height: 16.0),
                  // Text(
                  //   'Informasi Akun Kamu',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18.0,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(height: 8.0),
                  Card(
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(children: [
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Nama sesuai KTP'),
                                style: TextStyle(color: Colors.black)),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Tempat lahir sesuai KTP'),
                                style: TextStyle(color: Colors.black)),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Tanggal lahir sesuai KTP'),
                                style: TextStyle(color: Colors.black)),
                            Row(children: [
                              Expanded(
                                  child: DropdownButtonFormField<String>(
                                      items: ['Laki-laki', 'Perempuan']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value));
                                      }).toList(),
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          labelText: 'Jenis Kelamin'))),
                              Expanded(
                                  child: DropdownButtonFormField<String>(
                                      items: [
                                        'Islam',
                                        'Kristen',
                                        'Katolik',
                                        'Hindu',
                                        'Buddha',
                                        'Konghucu'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value));
                                      }).toList(),
                                      onChanged: (value) {},
                                      decoration:
                                          InputDecoration(labelText: 'Agama')))
                            ]),
                            Row(children: [
                              Expanded(
                                  child: DropdownButtonFormField<String>(
                                      items: [
                                        'Belum Kawin',
                                        'Kawin',
                                        'Cerai Hidup',
                                        'Cerai Mati'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value));
                                      }).toList(),
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          labelText: 'Status Perkawinan'))),
                              Expanded(
                                  child: DropdownButtonFormField<String>(
                                      items: [
                                        'SD',
                                        'SMP',
                                        'SMA/SMK',
                                        'D1/D2/D3',
                                        'D4/S1',
                                        'S2',
                                        'S3'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value));
                                      }).toList(),
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          labelText: 'Pendidikan Terakhir')))
                            ]),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Alamat Lengkap'),
                                maxLines: null,
                                style: TextStyle(color: Colors.black)),
                            DropdownButtonFormField<String>(
                                items: [
                                  'Aceh',
                                  'Sumatera Utara',
                                  'Sumatera Barat'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: new Text(value));
                                }).toList(),
                                onChanged: (value) {},
                                decoration:
                                    InputDecoration(labelText: 'Provinsi')),
                            DropdownButtonFormField<String>(
                                items: [
                                  'Kabupaten A',
                                  'Kabupaten B',
                                  'Kabupaten C'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: new Text(value));
                                }).toList(),
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                    labelText: 'Kabupaten/Kota')),
                            DropdownButtonFormField<String>(
                                items: [
                                  'Kecamatan A',
                                  'Kecamatan B',
                                  'Kecamatan C'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: new Text(value));
                                }).toList(),
                                onChanged: (value) {},
                                decoration:
                                    InputDecoration(labelText: 'Kecamatan')),
                            DropdownButtonFormField<String>(
                                items: [
                                  'Kelurahan A',
                                  'Kelurahan B',
                                  'Kelurahan C'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: new Text(value));
                                }).toList(),
                                onChanged: (value) {},
                                decoration:
                                    InputDecoration(labelText: 'Kelurahan')),
                            Row(children: [
                              Expanded(
                                  child: TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'RT/RW'),
                                      style: TextStyle(color: Colors.black))),
                              Expanded(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Kode Pos'),
                                      style: TextStyle(color: Colors.black)))
                            ]),
                            DropdownButtonFormField<String>(
                                items: ['WNI', 'WNA'].map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: new Text(value));
                                }).toList(),
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                    labelText: 'Status Kewarganegaraan'))
                          ])))
                ],
              )),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text('Lanjutkan', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF977EF2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
