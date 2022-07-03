import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:qrd_qr_card_ui/main.dart';
import 'package:qrd_qr_card_ui/screens/base_screen.dart';
import 'package:qrd_qr_card_ui/screens/profile_screen.dart';
import 'package:qrd_qr_card_ui/screens/sign_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future dbAddData(String name, String surname, String email, String password,
    String username) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));

  var result = await conn.query(
      'insert into users (Name, Surname, Email, Image, Password, IsLogged, Username) values (?, ?, ?, ?, ?, ?, ?)',
      [
        name,
        surname,
        email,
        "assets/pictures/blank-pp.jpeg",
        password,
        0,
        username,
      ]);
  print('Inserted row id=${result.insertId}');
}

var err = " ";

int userId;
bool isLogged;

Future login(String email, String password, BuildContext context) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));

  var id_result = await conn.query(
      'SELECT Id FROM `users` WHERE Email = "$email" AND Password = "$password"');
  if (id_result.isEmpty) {
    err = "Hatalı E-mail veya şifre!";
  } else {
    isLogged = true;
    err = " ";
    userId = id_result.first['Id'];
    var name_result = await conn
        .query('SELECT `Username` FROM `users` WHERE `users`.`Id` = $userId');
    String name_user = name_result.first['Username'];
    girdi(userId, name_user);
    await conn.query(
      'UPDATE `users` SET `IsLogged` = 1 WHERE `users`.`Id` = $userId',
    );

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BaseScreen()));
  }
}

Future logOut(BuildContext context) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));
  await conn.query(
    'UPDATE `users` SET `IsLogged` = 0 WHERE `users`.`Id` = $userId',
  );
  cikti(context);
}

girdi(
  int user_id,
  String userName,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("girdi_mi", true);
  await prefs.setInt("kullanici_id", user_id);
  await prefs.setString("userName", userName);
}

cikti(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("girdi_mi", false);
  await prefs.setInt("kullanici_id", 0);
  await prefs.setString("userName", " ");

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage()));
}

userName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int deneme = prefs.getInt("kullanici_id");
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));
  var result = await conn
      .query('SELECT `Username` FROM `users` WHERE `users`.`Id` = $deneme');
  var a = result.first['Username'];
  await prefs.setString("userName", "$a");
  user_userName = prefs.getString("userName");
  print(user_userName);
}

Future db_add_transaction(int user_id, String did_what, String image) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));

  await conn.query(
      'insert into `transaction` (user_id, did_what, Image) values ($user_id, "$did_what", "$image")');
}

Future db_add_card(int user_id, String did_what, String image) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));

  await conn.query(
      'insert into `transaction` (user_id, did_what, Image) values ($user_id, "$did_what", "$image")');
}
