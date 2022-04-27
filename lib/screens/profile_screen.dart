import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import '../Other_screens/Setting_screen.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PlatformFile pickedFile;

  Future uploadFile() async {
    final path = 'files/${pickedFile.name}';
    final file = File(pickedFile.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    setState(() {
      pickedFile = result.files.first;
    });
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
                      GestureDetector(
                          onTap: () {
                            selectFile().then((exit) {
                              uploadFile();
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
                                : Text("boş"),
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
