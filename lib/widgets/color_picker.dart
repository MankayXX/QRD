import 'package:flutter/material.dart';
import 'dart:math';

class ColorCard {
  Color color;
  int index;

  ColorCard({this.color, this.index});
}

const List cardColor = [
  Color(0xff6151FF),
  Color(0xffec3300),
  Color(0xff215f68),
  Color(0xffF25270),
  Color(0xff393B59),
  Color(0xff537073),
  Color(0xffA6465F),
  Color(0xff27238C),
  Color(0xff400101),
  Color(0xffD91448)
];

class ColorPicker extends StatefulWidget {
  final ColorCard color;
  const ColorPicker({Key key, this.color}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color a;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: changeColorPicker(), borderRadius: BorderRadius.circular(5)),
    );
  }
}

Color changeColorPicker() {
  var rng = 0;
  for (int i = 0; i < cardColor.length; i++) {
    rng++;
    return cardColor[rng];
  }
}

ColorCard bir = new ColorCard(color: cardColor[0], index: 0);
ColorCard iki = new ColorCard(color: cardColor[1], index: 1);
ColorCard uc = new ColorCard(color: cardColor[2], index: 2);
ColorCard dort = new ColorCard(color: cardColor[3], index: 3);
ColorCard bes = new ColorCard(color: cardColor[4], index: 4);
ColorCard alti = new ColorCard(color: cardColor[5], index: 5);
ColorCard yedi = new ColorCard(color: cardColor[6], index: 6);
ColorCard sekiz = new ColorCard(color: cardColor[7], index: 7);
ColorCard dokuz = new ColorCard(color: cardColor[8], index: 8);
ColorCard onn = new ColorCard(color: cardColor[9], index: 9);
List<ColorCard> cardsaa = [
  bir,
  iki,
  uc,
  dort,
  bes,
  alti,
  yedi,
  sekiz,
  dokuz,
  onn
];
