import 'package:qrd_qr_card_ui/data/date_date.dart';
import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/data/transaction_data.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';

import 'package:o_color_picker/o_color_picker.dart';

Color selectedColor = Colors.lightGreen[300];

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

int staticIndex = 100;
List arr = ["qrd"];

CardModel ilkKart = new CardModel(
    kartIsmi: "İlk kart",
    linkler: arr,
    oTarihi: tarih,
    index: staticIndex,
    kartRenk: randomColor());

CardModel kucukIlk = ilkKart;
CardModel profilIlk = ilkKart;

List<CardModel> myCards = [ilkKart];
List<CardModel> otherCards = [];
List<CardModel> myLittleCards = [kucukIlk];
List<CardModel> profileCards = [profilIlk];

addCard(String isim, List link, Color color) {
  staticIndex++;
  CardModel a = new CardModel(
    kartIsmi: isim,
    linkler: link,
    index: staticIndex,
    oTarihi: fullDate(),
    kartRenk: color,
  );

  myCards.add(a);
  myLittleCards.add(a);
  profileCards.add(a);
  _textFieldController2.clear();
  _textFieldController.clear();
}

addExistCard(String isim, List link, Color renk) {
  staticIndex++;
  CardModel a = new CardModel(
    kartIsmi: isim,
    linkler: link,
    index: staticIndex,
    oTarihi: fullDate(),
    kartRenk: renk,
  );

  otherCards.add(a);
}

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();

displayTextInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
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
                    focusedBorder: UnderlineInputBorder())),
            TextField(
                controller: _textFieldController2,
                decoration: InputDecoration(
                  hintText: "Linkler",
                  hintStyle: TextStyle(color: otherColor(isDarkTheme)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: otherColor(isDarkTheme))),
                  focusedBorder: UnderlineInputBorder(),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    primary: otherColor(isDarkTheme)),
                child: Text(
                  "Renk",
                  style: TextStyle(
                      fontFamily: "Poppins", color: otherColor(!isDarkTheme)),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Material(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                OColorPicker(
                                  selectedColor: selectedColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    selectedColor = color;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    primary: otherColor(isDarkTheme)),
                child: Text(
                  "Kaydet",
                  style: TextStyle(
                      fontFamily: "Poppins", color: otherColor(!isDarkTheme)),
                ),
                onPressed: () {
                  if (_textFieldController.text.isNotEmpty == true &&
                      _textFieldController2.text.isNotEmpty == true) {
                    addCard(_textFieldController.text,
                        _textFieldController2.text.split(" "), selectedColor);
                    addTransactionModel('Bir kart oluşturdu');
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

                  _textFieldController.clear();
                  _textFieldController2.clear();
                },
              ),
            ),
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

cardSettings(BuildContext context, int index) async {
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
            GestureDetector(
                onTap: () {
                  displayTextInputDialog3(context, index);
                },
                child: Text("Düzenle",
                    style: TextStyle(
                      color: otherColor(isDarkTheme),
                      fontSize: 20,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Divider(color: otherColor(isDarkTheme), height: 5),
            ),
            GestureDetector(
              onTap: () {
                if (myCards.length - 1 > 0) {
                  myCards.removeAt(index);
                  myLittleCards.removeAt(index);
                  profileCards.removeAt(index);
                  staticIndex--;
                  addTransactionModel("Bir kart sildi");
                  Navigator.of(context).pop();
                } else {
                  tekKart(context).then((exit) => Navigator.of(context).pop());
                }
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

changeCard(String isim, List link, index, Color color) {
  CardModel b = new CardModel(
    kartIsmi: isim,
    linkler: link,
    oTarihi: fullDate(),
    kartRenk: color,
  );
  myCards[index] = (b);
  profileCards[index] = (b);
  myLittleCards[index] = (b);
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
                    primary: otherColor(isDarkTheme)),
                child: Text("Renk",
                    style: TextStyle(
                        fontFamily: 'Popppins',
                        color: otherColor(!isDarkTheme))),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Material(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                OColorPicker(
                                  selectedColor: selectedColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    selectedColor = color;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    primary: otherColor(isDarkTheme)),
                child: Text("Kaydet",
                    style: TextStyle(
                        fontFamily: 'Popppins',
                        color: otherColor(!isDarkTheme))),
                onPressed: () {
                  List linkler = _textFieldController2.text.split(' ');
                  //Sadece İsim değişiyor

                  if (_textFieldController.text.isNotEmpty &&
                      _textFieldController2.text.isEmpty) {
                    changeCard(_textFieldController.text.inCaps,
                        myCards[index].linkler, index, myCards[index].kartRenk);
                    changeCard(
                        _textFieldController.text.inCaps,
                        profileCards[index].linkler,
                        index,
                        profileCards[index].kartRenk);
                    addTransactionModel('Bir kart düzenledi');
                  }
                  //Sadece linkler değişiyor
                  else if (_textFieldController.text.isEmpty &&
                      _textFieldController2.text.isNotEmpty) {
                    changeCard(myCards[index].kartIsmi, linkler, index,
                        myCards[index].kartRenk);
                    changeCard(profileCards[index].kartIsmi, linkler, index,
                        profileCards[index].kartRenk);
                    addTransactionModel('Bir kart düzenledi');
                  }
                  //sadece renk değişiyor
                  else if (_textFieldController.text.isEmpty &&
                      _textFieldController2.text.isEmpty &&
                      ((selectedColor != myCards[index].kartRenk) ||
                          (selectedColor != profileCards[index].kartRenk))) {
                    changeCard(myCards[index].kartIsmi, myCards[index].linkler,
                        index, selectedColor);
                    changeCard(profileCards[index].kartIsmi,
                        profileCards[index].linkler, index, selectedColor);
                    addTransactionModel('Bir kart düzenledi');
                  }

                  //isim ve link değişiyor
                  else if (_textFieldController.text.isNotEmpty &&
                      _textFieldController2.text.isNotEmpty) {
                    changeCard(_textFieldController.text.inCaps, linkler, index,
                        myCards[index].kartRenk);
                    changeCard(_textFieldController.text.inCaps, linkler, index,
                        profileCards[index].kartRenk);
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

tekKart(BuildContext context) {
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
          children: <Widget>[Text("Tek kartı silemezsin!")],
        ),
      );
    },
  );
}

otherCardSettings(BuildContext context, int index) async {
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
            GestureDetector(
                onTap: () {
                  displayTextInputDialog3(context, index);
                },
                child: Text("Düzenle",
                    style: TextStyle(
                      color: otherColor(isDarkTheme),
                      fontSize: 20,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Divider(color: otherColor(isDarkTheme), height: 5),
            ),
            GestureDetector(
              onTap: () {
                if (myCards.length - 1 > 0) {
                  otherCards.removeAt(index);
                  staticIndex--;
                  addTransactionModel("Bir kart sildi");
                  Navigator.of(context).pop();
                } else {
                  tekKart(context).then((exit) => Navigator.of(context).pop());
                }
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
