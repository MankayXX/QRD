import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Other_screens/theme_screen.dart';
import '../constants/color_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    final emailController = new TextEditingController();
    final passwordController = new TextEditingController();
    final GlobalKey<FormState> _key = new GlobalKey<FormState>();
    String errorMessage = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor(isDarkTheme),
          elevation: 0,
          centerTitle: true,
          title: qrdLogo(isDarkTheme),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: srcColor(isDarkTheme),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("🛠 Bitmedi 🛠",
                                    style: TextStyle(color: Colors.red)),
                                Text("Profil Resmi Ekranı",
                                    style: TextStyle(
                                        color: otherColor(isDarkTheme))),
                              ],
                            ));
                      });
                },
                child: CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 19,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/pictures/profile_pic.jpeg"),
                    radius: 17,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: otherColor(isDarkTheme),
                  size: 27,
                ),
                onPressed: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: srcColor(isDarkTheme),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("🛠 Bitmedi 🛠",
                                    style: TextStyle(color: Colors.red)),
                                Text("Bildirim Ekranı",
                                    style: TextStyle(
                                        color: otherColor(isDarkTheme))),
                              ],
                            ));
                      });
                })
          ],
        ),
        body: Form(
          key: _key,
          child: Center(
              child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: validateEmail,
              ),
              TextFormField(
                controller: passwordController,
                validator: validatePassword,
              ),
              Center(
                child: Text(errorMessage),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          errorMessage = "";
                        } on FirebaseAuthException catch (error) {
                          errorMessage = error.message;
                        }
                      }

                      setState(() {});
                    },
                    child: Text("Sign In")),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      setState(() {});
                    },
                    child: Text("Sign Up ")),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      setState(() {});
                    },
                    child: Text("Log Out")),
              ])
            ],
          )),
        ));
  }
}

String validateEmail(String formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "Email address is required.";
  }
  String pattern = r"\w+@\w+\.\w+";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return "Invalid Email address format.";
  }
  return null;
}

String validatePassword(String formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Password is required.";
  }
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  return null;
}
