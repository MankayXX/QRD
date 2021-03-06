import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrd_qr_card_ui/check.dart';
import 'package:qrd_qr_card_ui/data/theme_data.dart';
import 'package:qrd_qr_card_ui/screens/base_screen.dart';
import 'package:qrd_qr_card_ui/screens/sign_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (BuildContext context) => ThemeProvider(false),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        home: Check(),
      );
    });
  }
}

String user_userName;
control(BuildContext context) async {
  var loginData = await SharedPreferences.getInstance();
  user_userName = loginData.getString("userName");
  var newUser = (loginData.getBool("girdi_mi"));
  if (newUser) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BaseScreen()));
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
