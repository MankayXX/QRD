import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';
import 'package:qrd_qr_card_ui/widgets/my_card.dart';
import 'dart:math';

class CardScreen extends StatefulWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor(isDarkTheme),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Q  R  D",
          style: TextStyle(
            fontFamily: "Poppins",
            color: randomColor(),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: GestureDetector(
              onTap: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: srcColor(isDarkTheme),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("🛠 Bitmedi 🛠",
                                  style: TextStyle(color: Colors.red)),
                              Text("Profil Resmi Ekranı",
                                  style: TextStyle(
                                      color: otherColor(isDarkTheme))),
                            ],
                          ));
                    });
              },
              child: CircleAvatar(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                radius: 19,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/pictures/profile_pic.jpeg"),
                  radius: 17,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: otherColor(isDarkTheme),
                size: 27,
              ),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: srcColor(isDarkTheme),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("🛠 Bitmedi 🛠",
                                  style: TextStyle(color: Colors.red)),
                              Text("Bildirim Ekranı",
                                  style: TextStyle(
                                      color: otherColor(isDarkTheme))),
                            ],
                          ));
                    });
              })
        ],
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
                      onTap: () {
                        clickedCard(context, index).then((exit) {
                          setState(() {});
                        });
                      },
                      child: MyCard(
                        card: myCards[index],
                      ),
                    );
                  }),
            ),
            IconButton(
                iconSize: 30,
                icon: Icon(Icons.add_circle, size: 40),
                color: otherColor(isDarkTheme),
                onPressed: () {
                  displayTextInputDialog(context)
                      .then((exit) => setState(() {}));
                }),
            SizedBox(height: 5),
            Text(
              "Kart Ekle",
              style: TextStyle(
                color: otherColor(isDarkTheme),
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
