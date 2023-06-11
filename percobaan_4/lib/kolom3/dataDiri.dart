import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class dataDiri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.jpg"), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Consumer2<VerifikasiAkun, Login>(
                    builder: (context, verif, login, child) =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Identitas Kamu ' + login.email,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Mohon pastikan data dibawah ini sesuai dengan KTP kamu.',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nama sesuai KTP',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value){
                                    verif.nama = value;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Tempat lahir sesuai KTP',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value){
                                    verif.tempat_lahir = value;
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Tanggal lahir sesuai KTP',
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value){
                                    verif.tgl_lahir = value;
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        items: ['Laki-laki', 'Perempuan']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          verif.jenis_kelamin = value!;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Jenis Kelamin',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        items: [
                                          'Islam',
                                          'Kristen',
                                          'Katolik',
                                          'Hindu',
                                          'Buddha',
                                          'Konghucu',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          verif.agama = value!;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Agama',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        items: [
                                          'Belum Kawin',
                                          'Kawin',
                                          'Cerai Hidup',
                                          'Cerai Mati',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          verif.status_perkawinan = value!;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Status Perkawinan',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        items: [
                                          'SD',
                                          'SMP',
                                          'SMA/SMK',
                                          'D1/D2/D3',
                                          'D4/S1',
                                          'S2',
                                          'S3',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          verif.pend_terakhir = value!;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Pendidikan Terakhir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Alamat Lengkap',
                                  ),
                                  maxLines: null,
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value){
                                    verif.alamat = value;
                                  },
                                ),
                                DropdownButtonFormField<String>(
                                  items: [
                                    'Aceh',
                                    'Sumatera Utara',
                                    'Sumatera Barat',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    verif.provinsi = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Provinsi',
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  items: [
                                    'Kabupaten A',
                                    'Kabupaten B',
                                    'Kabupaten C',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    verif.kota = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Kabupaten/Kota',
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  items: [
                                    'Kecamatan A',
                                    'Kecamatan B',
                                    'Kecamatan C',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    verif.kecamatan = value!;

                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Kecamatan',
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  items: [
                                    'Kelurahan A',
                                    'Kelurahan B',
                                    'Kelurahan C',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    verif.kelurahan = value!;
                                    
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Kelurahan',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'RT/RW',
                                        ),
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (value){
                                          verif.rtrw = value;
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Kode Pos',
                                        ),
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (value){
                                          verif.kodepos = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<String>(
                                  items: ['WNI', 'WNA'].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    verif.status_kewarganegaraan = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Status Kewarganegaraan',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              onPressed: () async {
                                final statusCode = await verif.VerifyProcess(login.user_id);
                                if(statusCode == 200){
                                  // verify berhasil
                                }
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Lanjutkan',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF977EF2),
                                textStyle: TextStyle(fontSize: 16),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
