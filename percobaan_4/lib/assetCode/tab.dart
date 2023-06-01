import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Hello"),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 200,
              ),
              Container(
                height: 70,
                color: Colors.blue,
                child: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.abc),
                      text: "abc",
                    ),
                    Tab(
                      icon: Icon(Icons.ac_unit),
                      text: "ac",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("satu")),
                    Center(child: Text("dua")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
