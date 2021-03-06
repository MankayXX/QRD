import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/data/transaction_data.dart';
import 'package:qrd_qr_card_ui/widgets/my_card.dart';
import 'package:qrd_qr_card_ui/widgets/transaction_card.dart';
import 'dart:math';
import '../Other_screens/theme_screen.dart';

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
        title: qrdLogo(isDarkTheme),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/pictures/profile_pic.jpeg")),
                )),
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
                              Text("Bildirimler",
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
                        onLongPress: () {
                          cardSettings(context, index).then((exit) {
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
