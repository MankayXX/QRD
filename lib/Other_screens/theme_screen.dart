import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/theme_data.dart';

class Tema extends StatefulWidget {
  const Tema({Key key}) : super(key: key);

  @override
  _TemaState createState() => _TemaState();
}

bool isDarkTheme = true;

int _value = 2;

class _TemaState extends State<Tema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          iconTheme: IconThemeData(
            color: otherColor(isDarkTheme),
          ),
          centerTitle: false,
          title: Text(
            "Tema Seç",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 550,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Aydınlık",
                                style: TextStyle(
                                    color: otherColor(isDarkTheme),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 18),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      if (isDarkTheme == true) {
                                        ThemeProvider themeProvider =
                                            Provider.of<ThemeProvider>(context,
                                                listen: false);
                                        themeProvider.swapTheme();
                                        setState(() {
                                          _value = value;
                                          isDarkTheme = false;
                                        });
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 550,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Karanlık",
                                style: TextStyle(
                                    color: otherColor(isDarkTheme),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 18),
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                    value: 2,
                                    groupValue: _value,
                                    onChanged: (value) {
                                      if (isDarkTheme == false) {
                                        ThemeProvider themeProvider =
                                            Provider.of<ThemeProvider>(context,
                                                listen: false);
                                        themeProvider.swapTheme();
                                        setState(() {
                                          _value = value;
                                          isDarkTheme = true;
                                        });
                                      }
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ])),
        ));
  }
}
