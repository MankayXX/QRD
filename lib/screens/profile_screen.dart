import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import '../Other_screens/Setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount _currentUser;
    final GoogleSignInAccount user = _currentUser;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
                height: 37,
                width: 550,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
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
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          Text("Profiller menüsü",
                                              style: TextStyle(
                                                  color:
                                                      otherColor(isDarkTheme))),
                                        ],
                                      ));
                                });
                          },
                          child: Icon(FontAwesomeIcons.chevronDown)),
                      SizedBox(width: 10),
                      Text("deneme")
                    ]),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => SettingScreen()))
                              .then((_) => setState(() {}));
                        },
                        child: Icon(Icons.menu, size: 40)),
                  ],
                )),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text("4",
                            style: TextStyle(
                                color: bgColor(!isDarkTheme),
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Text("Kart",
                            style: TextStyle(
                                color: bgColor(!isDarkTheme),
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ]),
                      Column(children: [
                        Text("20",
                            style: TextStyle(
                                color: bgColor(!isDarkTheme),
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Text("Okutma",
                            style: TextStyle(
                                color: bgColor(!isDarkTheme),
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ]),
                    ],
                  )
                ]),
          ),
        ));
  }
}
