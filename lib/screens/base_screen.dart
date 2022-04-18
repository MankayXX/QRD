import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/explore_screen.dart';
import 'package:qrd_qr_card_ui/screens/home_Screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/screens/profile_screen.dart';
import 'package:qrd_qr_card_ui/screens/qr_screen.dart';
import 'card_screen.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/screens/sign_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var ekranlar;

  List _login() {
    if (_auth.currentUser == null) {
      return [
        SignInDemo(),
      ];
    } else {
      return [
        HomeScreen(),
        ExploreScreen(),
        QRViewExample(),
        CardScreen(),
        ProfileScreen(),
      ];
    }
  }

  List screens() {
    return [
      HomeScreen(),
      ExploreScreen(),
      QRViewExample(),
      CardScreen(),
      ProfileScreen(),
    ];
  }
  //TODO kullanıcı giriş ekranını şimdilik kapatıyorum, çok fazla hata alıyorum.
/*
  _ekranlar() {
    if (_auth.currentUser == null) {
      return ekranlar = [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.sign), label: "Giriş TEST"),
      ];
    } else {
      return ekranlar = [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home), label: "Anasayfa"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search), label: "Keşfet"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.qrcode), label: "Tara TEST"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.idCard), label: "Kartlar"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidUser), label: "Profil"),
      ];
    }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens().elementAt(_selectedIndex),
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
    );
  }
}
