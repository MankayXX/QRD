import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

bool bildirim;

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 570,
                              height: 90,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Text(
                                          "Tüm bildirimler",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                        SizedBox(width: 167),
                                        Container(
                                          width: 30,
                                          child: Switch(
                                              activeColor:
                                                  switchColor(isDarkTheme),
                                              inactiveTrackColor: Colors.grey,
                                              value: bildirim,
                                              onChanged: (value) {
                                                setState(() {
                                                  bildirim = value;
                                                  print(bildirim);
                                                });
                                              }),
                                        )
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
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text("🛠 Bitmedi 🛠",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red)),
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
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                      ],
                    )
                  ])),
        ));
  }
}
