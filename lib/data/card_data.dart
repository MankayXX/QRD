import 'package:qrd_qr_card_ui/data/date_date.dart';
import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/data/transaction_data.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CardModel {
  String kartIsmi;
  List linkler;
  String oTarihi;
  Color kartRenk;
  int index;

  CardModel(
      {this.kartIsmi, this.linkler, this.oTarihi, this.kartRenk, this.index});
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}

List arr = ["qrd"];
CardModel ilkKart = new CardModel(
    kartIsmi: "İlk kart",
    linkler: arr,
    oTarihi: tarih,
    index: 0,
    kartRenk: randomColor());

List<CardModel> myCards = [ilkKart];

addCard(String isim, List link) {
  CardModel a = new CardModel(
    kartIsmi: isim,
    linkler: link,
    oTarihi: fullDate(),
    kartRenk: randomColor(),
  );

  myCards.add(a);
}

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();

displayTextInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: srcColor(isDarkTheme),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        title: Text(
          'Kart bilgileri',
          style: TextStyle(color: otherColor(isDarkTheme)),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                    hintText: "Kart İsmi",
                    hintStyle: TextStyle(color: otherColor(isDarkTheme)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: otherColor(isDarkTheme)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: randomColor()),
                    ))),
            TextField(
                controller: _textFieldController2,
                decoration: InputDecoration(
                  hintText: "Linkler",
                  hintStyle: TextStyle(color: otherColor(isDarkTheme)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: otherColor(isDarkTheme))),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: randomColor()),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    primary: randomColor()),
                child: Text(
                  "Kaydet",
                  style: TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                onPressed: () {
                  List linkler = _textFieldController2.text.split(' ');
                  if (_textFieldController.text.isNotEmpty == true &&
                      _textFieldController2.text.isNotEmpty == true) {
                    addCard(_textFieldController.text, linkler);
                    addTransactionModel('Bir kart oluşturdu');
                    _textFieldController.clear();
                    _textFieldController2.clear();
                    Navigator.of(context).pop();
                  } else {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Lütfen her alanı doldur."),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      );
    },
  );
}

displayTextInputDialog2(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        title: Text('Linkler'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "link"),
            ),
            ElevatedButton(
              child: Text("Kaydet"),
              onPressed: () {
                //launchURL(_textFieldController.text, 1);

                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: bgColor(isDarkTheme),
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
              },
            )
          ],
        ),
      );
    },
  );
}

launchURL(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    print('Could not launch $link');
  }
}

clickedCard(BuildContext context, int index) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: srcColor(isDarkTheme),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: GestureDetector(
                  onTap: () {
                    displayTextInputDialog3(context, index);
                  },
                  child: Text("Düzenle",
                      style: TextStyle(
                        color: otherColor(isDarkTheme),
                        fontSize: 20,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Divider(color: otherColor(isDarkTheme), height: 5),
            ),
            GestureDetector(
              onTap: () {
                if (myCards.length - 1 > 0) {
                  myCards.removeAt(index);
                  addTransactionModel("Bir kart sildi");
                }
                Navigator.of(context).pop();
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                  ),
                  child: Text("Sil",
                      style: TextStyle(
                        color: otherColor(isDarkTheme),
                        fontSize: 20,
                      ))),
            ),
          ],
        ),
      );
    },
  );
}

changeCard(String isim, List link, index) {
  CardModel b = new CardModel(
    kartIsmi: isim,
    linkler: link,
    oTarihi: fullDate(),
    kartRenk: randomColor(),
  );
  myCards[index] = (b);
}

displayTextInputDialog3(BuildContext context, int index) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        title: Text('Kart bilgileri'),
        backgroundColor: srcColor(isDarkTheme),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: "Kart İsmi",
                  hintStyle: TextStyle(color: otherColor(isDarkTheme)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: otherColor(isDarkTheme)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: randomColor()),
                  )),
            ),
            TextField(
              controller: _textFieldController2,
              decoration: InputDecoration(
                  hintText: "Linkler",
                  hintStyle: TextStyle(color: otherColor(isDarkTheme)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: otherColor(isDarkTheme)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: randomColor()),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    primary: randomColor()),
                child: Text("Kaydet", style: TextStyle(fontFamily: 'Popppins')),
                onPressed: () {
                  List linkler = _textFieldController2.text.split(' ');
                  //Sadece İsim değişiyor
                  if (_textFieldController.text.isNotEmpty &&
                      _textFieldController2.text.isEmpty) {
                    changeCard(_textFieldController.text.inCaps,
                        myCards[index].linkler, index);
                    print("sadece isim");
                    addTransactionModel('Bir kart düzenledi');
                  }
                  //Sadece linkler değişiyor
                  else if (_textFieldController.text.isEmpty &&
                      _textFieldController2.text.isNotEmpty) {
                    changeCard(myCards[index].kartIsmi, linkler, index);
                    addTransactionModel('Bir kart düzenledi');
                    print("sadece link");
                  }
                  //her ikisi de değişiyor
                  else if (_textFieldController.text.isNotEmpty &&
                      _textFieldController2.text.isNotEmpty) {
                    changeCard(
                        _textFieldController.text.inCaps, linkler, index);
                    print("her ikisi");
                    addTransactionModel('Bir kart düzenledi');
                  }
                  //hiçbirisi değişmiyor
                  else {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Lütfen herhangi bir alanı doldur."),
                          );
                        });
                  }
                  _textFieldController.clear();
                  _textFieldController2.clear();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      );
    },
  );
}
