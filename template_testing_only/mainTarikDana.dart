import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TarikTunaiPage(),
    );
  }
}

class TarikTunaiPage extends StatefulWidget {
  @override
  _TarikTunaiPageState createState() => _TarikTunaiPageState();
}

class _TarikTunaiPageState extends State<TarikTunaiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showPopup() {
    _animationController.forward();
  }

  void _hidePopup() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Tarik Tunai via ATM'),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              // Implement your help button logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Metode Pembayaran: '),
                    DropdownButton<String>(
                      value: 'BCA',
                      onChanged: (newValue) {
                        // Handle dropdown value change
                      },
                      items: ['BCA', 'BNI', 'BRI'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 8),
                    Text('Nominal Amount'),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    'PILIHLAH JUMLAH',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 1')),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 2')),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 3')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 4')),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 5')),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Handle button pressed
                              _showPopup();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Center(child: Text('Amount 6')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showPopup();
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(child: Text('Jumlah lainnya')),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Text('Biaya Admin Rp2.000,00'),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text('Maksimal Penarikan Rp2.000.000,00'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: _animation.value * 200, // Adjust the height as needed
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Add your popup content here
                        Text('Popup content goes here.'),
                        ElevatedButton(
                          onPressed: () {
                            _hidePopup();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
