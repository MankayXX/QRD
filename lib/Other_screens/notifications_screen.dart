import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

bool bildirim = true;

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          iconTheme: IconThemeData(
            color: otherColor(isDarkTheme), //change your color here
          ),
          centerTitle: false,
          title: Text(
            "Bildirimler",
            style: TextStyle(
                color: otherColor(isDarkTheme),
                fontWeight: FontWeight.w100,
                fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bildirim = !bildirim;
                                          print(bildirim);
                                        });
                                      },
                                      child: Text(
                                        "Tüm bildirimler",
                                        style: TextStyle(
                                            color: otherColor(isDarkTheme),
                                            fontWeight: FontWeight.w100,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      child: Switch(
                                          activeColor: switchColor(isDarkTheme),
                                          inactiveTrackColor: Colors.grey,
                                          value: bildirim,
                                          onChanged: (value) {
                                            setState(() {
                                              bildirim = value;
                                              print(bildirim);
                                            });
                                          }),
                                    ),
                                  ]),
                              SizedBox(height: 15),
                              Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              backgroundColor:
                                                  srcColor(isDarkTheme),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text("🛠 Bitmedi 🛠",
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  Text(
                                                      "Okuma, Okutma ve Etkileşim ayarları",
                                                      style: TextStyle(
                                                          color: otherColor(
                                                              isDarkTheme))),
                                                ],
                                              ));
                                        });
                                  },
                                  child: Text(
                                    "Okuma, Okutma ve Etkileşim",
                                    style: TextStyle(
                                        color: otherColor(isDarkTheme),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )),
                    SizedBox(height: 15)
                  ])),
        ));
  }
}
