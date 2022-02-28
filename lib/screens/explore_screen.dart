import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';
import 'package:qrd_qr_card_ui/widgets/my_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor(isDarkTheme),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: 37,
            width: 550,
            decoration: BoxDecoration(
              color: srcColor(isDarkTheme),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: srcColor(!isDarkTheme),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none),
                  hintText: 'Ara',
                  fillColor: abColor(isDarkTheme)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: myCards.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        cardSettings(context, index).then((exit) {
                          setState(() {});
                        });
                        print("basılı tuttu");
                      },
                      onTap: () {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  backgroundColor: srcColor(isDarkTheme),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("🛠 Bitmedi 🛠",
                                          style: TextStyle(color: Colors.red)),
                                      Text("QR Kod",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme))),
                                    ],
                                  ));
                            });
                      },
                      child: MyCard(
                        card: myCards[index],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
