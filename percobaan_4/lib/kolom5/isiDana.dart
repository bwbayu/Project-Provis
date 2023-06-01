import 'package:flutter/material.dart';

class isiDana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Tubes',
      home: Scaffold(
        backgroundColor: Color(0xFF2E2960),
        appBar: AppBar(
          backgroundColor: Color(0xFF2E2960),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2960),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mau isi saldo dengan cara',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'apa?',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transfer Bank',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: const Color(0xFF94E3BF),
                                child: ListTile(
                                  onTap: () {
                                    // Add your onTap logic here
                                  },
                                  leading: Icon(
                                    Icons.account_balance,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  title: Text(
                                    'Bank',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            );
                          },
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
    );
  }
}
