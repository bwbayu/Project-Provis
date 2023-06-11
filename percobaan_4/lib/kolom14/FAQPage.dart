import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                  title: Text(
                    'FAQ',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(8.0),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 32.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: ExpansionPanelList(
                              expansionCallback:
                                  (int itemIndex, bool isExpanded) {
                                setState(() {
                                  _data[index].isExpanded = !isExpanded;
                                });
                              },
                              children: [
                                ExpansionPanel(
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        _data[index].headerValue,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                        ),
                                      ),
                                    );
                                  },
                                  body: ListTile(
                                    title: Text(
                                      _data[index].expandedValue,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'To delete this panel, tap the trash can icon',
                                    ),
                                    trailing: const Icon(Icons.delete),
                                    onTap: () {
                                      setState(() {
                                        _data.removeAt(index);
                                      });
                                    },
                                  ),
                                  isExpanded: _data[index].isExpanded,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Pertanyaan ${index + 1}',
      expandedValue: 'Jawaban ${index + 1}',
    );
  });
}
