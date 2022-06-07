import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:qrd_qr_card_ui/screens/base_screen.dart';
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
bool isLogged = true;
var userId;
Future login(String email, String password, BuildContext context) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));

  var result = await conn.query(
      'SELECT Id FROM `users` WHERE Email = "$email" AND Password = "$password"');
  if (result.isEmpty) {
    err = "Hatalı E-mail veya şifre!";
  } else {
    isLogged = true;
    err = " ";
    userId = result.first['Id'];
    girdi(userId);
    girdiMi().then((value) {
      print(value);
    });
    await conn.query(
      'UPDATE `users` SET `IsLogged` = 1 WHERE `users`.`Id` = $userId',
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BaseScreen()));
  }
  return {isLogged, userId};
}

Future userName(int id) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mert_mankay',
      db: 'QRD',
      password: 'mertmankay'));
  await conn.query('SELECT `Username` FROM `users` WHERE `users`.`Id` = $id');
}

girdi(var userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("girdi_mi", true);
  await prefs.setInt("kullanıcı_id", userId);
}

cikti() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("girdi_mi", false);
}

girdiMi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = prefs.getBool("girdi_mi");
  print(isLogged);
}
