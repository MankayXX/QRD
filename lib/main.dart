import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrd_qr_card_ui/data/theme_data.dart';
import 'package:qrd_qr_card_ui/screens/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          home: BaseScreen());
    });
  }
}
