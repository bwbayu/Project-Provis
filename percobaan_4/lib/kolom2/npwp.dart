import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final TextEditingController _form1Controller = TextEditingController();
  final TextEditingController _form2Controller = TextEditingController();

  @override
  void dispose() {
    _form1Controller.dispose();
    _form2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Tubes',
      home: Scaffold(
        backgroundColor: Color(0xFF2D2960),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFFF8F6F6),
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2960),
                    shape: BoxShape.rectangle,
                  ),
                  child: ListTile(
                    title: Text(
                      'Tanda Tangan',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFFF7F8F9),
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Text(
                      'Tanda tangan sesuai dengan KTP di atas kertas.',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFF2F5F8),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    tileColor: Color(0xFF2D2960),
                    dense: false,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/343/600',
                          width: double.infinity,
                          height: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 16, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor NPWP',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.white, // Background color
                      child: TextFormField(
                        controller: _form1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Pemilik NPWP',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      color: Colors.white, // Background color
                      child: TextFormField(
                        controller: _form2Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2960),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Lanjutkan',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF977EF2),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
