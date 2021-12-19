import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;

  ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );

  ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkmodeBg,
      fontFamily: "Poppins",
      appBarTheme: AppBarTheme(
        backgroundColor: darkmodeAb,
      ));

  ThemeProvider(bool isDarkMode) {
    this._selectedTheme = !isDarkMode ? dark : light;
  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
