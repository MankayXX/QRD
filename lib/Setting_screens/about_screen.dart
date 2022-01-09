import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/app_textstyle.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
            "Hakkında",
            style: TextStyle(
                color: otherColor(isDarkTheme),
                fontWeight: FontWeight.w100,
                fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "İsim",
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                    Text("Mert Mankay",
                        style: TextStyle(
                          color: abColor(isDarkTheme),
                          fontFamily: "Poppins",
                        )),
                    SizedBox(height: 15),
                    Text(
                      "Numarası",
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                    Text("20350059",
                        style: TextStyle(
                          color: abColor(isDarkTheme),
                          fontFamily: "Poppins",
                        )),
                    SizedBox(height: 15),
                    Text(
                      "Konu",
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                    Text("QR Kod ile çalışan kartvizit uygulaması",
                        style: TextStyle(
                          color: abColor(isDarkTheme),
                          fontFamily: "Poppins",
                        )),
                    SizedBox(height: 15),
                    Text(
                      "Başlama Tarihi",
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                    Text("3 Ekim 2021",
                        style: TextStyle(
                          color: abColor(isDarkTheme),
                          fontFamily: "Poppins",
                        )),
                    SizedBox(height: 15),
                    Text(
                      "Uygulama sürümü",
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          color: abColor(isDarkTheme),
                          size: 15,
                        ),
                        SizedBox(width: 10),
                        Text("0.3 Beta",
                            style: TextStyle(
                              color: abColor(isDarkTheme),
                              fontFamily: "Poppins",
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
