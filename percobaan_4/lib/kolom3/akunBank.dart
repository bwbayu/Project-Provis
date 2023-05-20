import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akun Bank',
      home: Scaffold(
        backgroundColor: Color(0xFF2E2961),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
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
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Akun Bank',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Rekening yang Anda input akan digunakan untuk penarikan dana Anda.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                      Card(
                        child:
                          Padding(padding:
                            EdgeInsets.all(16.0),
                            child:
                              Column(children:[
                                DropdownButtonFormField<String>(
                                  items:['Bank A','Bank B','Bank C'].map((String value){
                                    return DropdownMenuItem<String>(
                                      value:value,
                                      child:new Text(value)
                                    );
                                  }).toList(),
                                  onChanged:(value){},
                                  decoration:
                                      InputDecoration(labelText:'Nama Bank')
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText:'Nama Pemilik Akun'),
                                  style:
                                      TextStyle(color:Colors.black)
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(labelText:'Nomor Rekening'),
                                  style:
                                      TextStyle(color:Colors.black)
                                )
                              ])
                          )
                      )
                    ],
                  )
              ),
              Align(
                alignment: Alignment.bottomRight,
                child:ElevatedButton(
                  onPressed: () {},
                  child:
                    Text('Lanjutkan', style: TextStyle(color: Colors.black)),
                  style:ElevatedButton.styleFrom(primary: Color(0xFF977EF2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
