import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/Connection.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Other_screens/Setting_screen.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PlatformFile pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    }
  }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                          onTap: () {
                            print("kullanıcı değiştirme");
                          },
                          child: Icon(FontAwesomeIcons.chevronDown,
                              color: otherColor(isDarkTheme))),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => SettingScreen()))
                              .then((_) => setState(() {}));
                        },
                        child: Text("deneme",
                            style: TextStyle(color: otherColor(isDarkTheme))),
                      )
                    ]),
                    GestureDetector(
                        onTap: () async {
                          /*Navigator.of(context)
                              .push(MaterialPageRoute(
                                  builder: (context) => SettingScreen()))
                              .then((_) => setState(() {}));*/
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String deneme = prefs.getString("userName");

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
                                        Text("$deneme",
                                            style: TextStyle(
                                                color:
                                                    otherColor(isDarkTheme))),
                                      ],
                                    ));
                              });
                          userName();
                        },
                        child: Icon(Icons.menu,
                            size: 40, color: otherColor(isDarkTheme))),
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
                      GestureDetector(
                          onTap: () {
                            selectFile().then((exit) {
                              print(pickedFile.path);
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: pickedFile != null
                                ? Image.file(
                                    File(pickedFile.path),
                                    height: 100,
                                    width: 100,
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                        "assets/pictures/profile_pic.jpeg")),
                          )),
                      Column(children: [
                        Text(myCards.length.toString(),
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
                        Text(otherCards.length.toString(),
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
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: profileCards.length,
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
                                  },
                                  child: ProfileCard(
                                    profile_card: profileCards[index],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
