import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrd_qr_card_ui/check.dart';
import 'package:qrd_qr_card_ui/data/theme_data.dart';
import 'package:qrd_qr_card_ui/screens/base_screen.dart';
import 'package:qrd_qr_card_ui/screens/sign_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isLogged = false;
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
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeProvider.getTheme,
        home: Check(),
      );
    });
  }
}

aaaa(BuildContext context) async {
  var loginData = await SharedPreferences.getInstance();
  var newUser = (loginData.getBool("girdi_mi"));
  print(newUser);
  var a = true;
  if (a) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BaseScreen()));
  } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
