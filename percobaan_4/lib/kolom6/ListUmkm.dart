import 'package:flutter/material.dart';

class listUMKM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
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
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp xxx',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffcb5f18),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
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
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp xxx',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffcb5f18),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
