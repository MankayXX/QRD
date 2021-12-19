import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/data/date_date.dart';
import 'dart:math';

class TransactionModel {
  String name;
  String avatar;
  NetworkImage deneme;
  String date;
  String didWhat;
  Color color;

  TransactionModel({
    this.name,
    this.deneme,
    this.avatar,
    this.date,
    this.didWhat,
    this.color,
  });
}

List<TransactionModel> myTransactions = [
  TransactionModel(
      name: "Mert Mankay",
      avatar: "assets/icons/avatar2_kopya.png",
      deneme: NetworkImage(
          "https://instagram.fesb3-2.fna.fbcdn.net/v/t51.2885-19/s320x320/260690665_345701707316131_5176740235880354534_n.jpg?_nc_ht=instagram.fesb3-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=jtNe_Bl6eO8AX_s9veF&tn=xtKeq7gcSjrcrTWy&edm=ABfd0MgBAAAA&ccb=7-4&oh=5098620e9b50de3cda165fe00e3d0fae&oe=61AB260F&_nc_sid=7bff83"),
      didWhat: "Uygulamayı açtı",
      date: tarih,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)])
];

addTransactionModel(String what) {
  TransactionModel a = new TransactionModel(
      name: "Mert Mankay",
      avatar: "assets/icons/avatar2_kopya.png",
      deneme: NetworkImage(
          "https://instagram.fesb3-2.fna.fbcdn.net/v/t51.2885-19/s320x320/260690665_345701707316131_5176740235880354534_n.jpg?_nc_ht=instagram.fesb3-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=jtNe_Bl6eO8AX_s9veF&tn=xtKeq7gcSjrcrTWy&edm=ABfd0MgBAAAA&ccb=7-4&oh=5098620e9b50de3cda165fe00e3d0fae&oe=61AB260F&_nc_sid=7bff83"),
      didWhat: what,
      date: tarih,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  myTransactions.insert(0, a);
}
