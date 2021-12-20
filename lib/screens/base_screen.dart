import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/Setting_screens/notifications_screen.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/explore_screen.dart';
import 'package:qrd_qr_card_ui/screens/home_Screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';
import 'card_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    CardScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: bgColor(isDarkTheme),
          selectedItemColor: abColor(isDarkTheme),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), label: "Anasayfa"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.search), label: "Keşfet"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.idCard), label: "Kartlar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Ayarlar"),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
