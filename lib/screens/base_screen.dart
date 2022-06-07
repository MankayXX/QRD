import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/main.dart';
import 'package:qrd_qr_card_ui/screens/explore_screen.dart';
import 'package:qrd_qr_card_ui/screens/home_Screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/screens/profile_screen.dart';
import 'package:qrd_qr_card_ui/screens/qr_screen.dart';
import 'card_screen.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  var ekranlar = [
    HomeScreen(),
    ExploreScreen(),
    QRViewExample(),
    CardScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ekranlar.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: bgColor(isDarkTheme),
              selectedItemColor: abColor(isDarkTheme),
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home),
                  label: "Anasayfa",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.waving_hand_outlined), label: "Arşiv"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.qrcode), label: "Tara"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.idCard), label: "Kartlar"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.solidUser), label: "Profil"),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ));
  }
}
