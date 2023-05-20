import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Page',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final TextEditingController _controller = TextEditingController();
  double _loanAmount = 0;
  double _interestRate = 0.14;
  int _tenor = 12;

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
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Mulai Pendanaan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: [
                        ListTile(
                          title: Text('Lama Tenor',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('$_tenor Bulan'),
                        ),
                        ListTile(
                          title: Text('Bunga Efektif',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${_interestRate * 100}% per tahun'),
                        ),
                        ListTile(
                          title: Text('Frekuensi Angsuran Bunga',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Bulanan'),
                        ),
                        ListTile(
                          title: Text('Frekuensi Angsuran Pokok',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Bulanan'),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Jumlah Pemberian Pinjaman',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            icon: Icon(Icons.calculate),
                            onPressed: () {
                              setState(() {
                                _loanAmount =
                                    double.tryParse(_controller.text) ?? 0;
                              });
                            }),
                        hintText: 'Masukkan jumlah pinjaman'),
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ListTile(
                            title: Text('Jumlah Pinjaman'),
                            subtitle:
                                Text('Rp ${_loanAmount.toStringAsFixed(2)}')),
                        ListTile(
                            title: Text('Bunga'),
                            subtitle: Text(
                                'Rp ${(_loanAmount * _interestRate).toStringAsFixed(2)}')),
                        Divider(),
                        ListTile(
                            title: Text('Target Pengembalian'),
                            subtitle: Text(
                                'Rp ${(_loanAmount * (1 + _interestRate)).toStringAsFixed(2)}')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan kode aksi yang ingin Anda jalankan saat tombol ditekan
                    },
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF977EF2),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: InkWell(
                        onTap: null,
                        child: Text("Syarat dan Ketentuan",
                            style: TextStyle(
                                decoration: TextDecoration.underline, color: Colors.white))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
