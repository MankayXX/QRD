import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Auth User ( Logged" +
                  (user == null ? " out" : " in") +
                  " )"),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
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
            )));
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
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  return null;
}
