import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key key}) : super(key: key);
  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String imageUrl;
  String word;
  bool color = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          centerTitle: true,
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
                child: CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
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
        body: ListView(children: [
          Center(
              child: Column(children: [
            SizedBox(height: 20),
            Stack(children: [
              Center(
                child: QrImage(
                  data: "www.instagram.com",
                  version: QrVersions.auto,
                  gapless: true,
                  size: 200.0,
                  foregroundColor: Colors.white,
                ),
              ),
            ]),
          ])),
        ]));
  }
}
