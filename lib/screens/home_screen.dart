import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/data/transaction_data.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';
import 'package:qrd_qr_card_ui/widgets/my_card.dart';
import 'package:qrd_qr_card_ui/widgets/transaction_card.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var pp = Colors.primaries[Random().nextInt(Colors.primaries.length)];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: bgColor(isDarkTheme),
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
                backgroundColor: pp,
                radius: 19,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/pictures/profile_pic.jpeg"),
                    radius: 17),
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
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: myCards.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
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
              SizedBox(
                height: 30,
              ),
              Text(
                "Son İşlemler",
                style: TextStyle(
                  color: otherColor(isDarkTheme),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                  itemCount: myTransactions.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return TransactionCard(transaction: myTransactions[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
