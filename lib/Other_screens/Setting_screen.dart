import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/Other_screens/about_screen.dart';
import 'package:qrd_qr_card_ui/data/Connection.dart';
import 'package:qrd_qr_card_ui/screens/profile_screen.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/sign_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: bgColor(!isDarkTheme)),
              onPressed: () {
                Navigator.pop(context);
              }),
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
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            Text("Bildirim ayarları",
                                                style: TextStyle(
                                                    color: otherColor(
                                                        isDarkTheme))),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.notifications_none),
                                        SizedBox(width: 15),
                                        Text(
                                          "Bildirimler",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
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
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            Text("Gizlilik ayarları",
                                                style: TextStyle(
                                                    color: otherColor(
                                                        isDarkTheme))),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.lock_outline),
                                        SizedBox(width: 15),
                                        Text(
                                          "Gizlilik",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
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
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            Text("Güvenlik ayarları",
                                                style: TextStyle(
                                                    color: otherColor(
                                                        isDarkTheme))),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.shield_outlined),
                                        SizedBox(width: 15),
                                        Text(
                                          "Güvenlik",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
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
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            Text("Yardım bilgileri",
                                                style: TextStyle(
                                                    color: otherColor(
                                                        isDarkTheme))),
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        IconTheme(
                                          data: IconThemeData(
                                            color: otherColor(isDarkTheme),
                                          ),
                                          child: Icon(Icons.help_outline),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          "Yardım",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.lock_outline),
                                        SizedBox(width: 15),
                                        Text(
                                          "Hesap",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AboutScreen()));
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.info_outline),
                                        SizedBox(width: 15),
                                        Text(
                                          "Hakkında",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => Tema()))
                                  .then((_) => setState(() {}));
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(textIcon(isDarkTheme)),
                                        SizedBox(width: 15),
                                        Text(
                                          "Tema",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              logOut(context);
                            },
                            child: Container(
                              width: 550,
                              height: 35,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.lock_outline),
                                        SizedBox(width: 15),
                                        Text(
                                          "Çıkış",
                                          style: TextStyle(
                                              color: otherColor(isDarkTheme),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18),
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

class CurrentTheme extends ChangeNotifier {
  ThemeData normal = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );

  ThemeData gece = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkmodeBg,
      fontFamily: "Poppins",
      appBarTheme: AppBarTheme(
        backgroundColor: darkmodeAb,
      ));
}

void _nagivateThemeScreen() {}
