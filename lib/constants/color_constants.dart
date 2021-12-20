import 'package:flutter/material.dart';
import 'dart:math';

//! Normal Renkler

const kPrimaryColor = Color(0xff00444f);
const kSecondaryColor = Color(0xffff7b67);
const kThirdColor = Color(0xfffcd76b);
const kBackgroundColor = Color(0xfffff9f4);
const kfourthColor = Color(0xff32FA93);

const colorsLM = [
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

const colorsDM = [
  Color(0xff6151FF),
  Color(0xffec3300),
  Color(0xffF25270),
  Color(0xffA6465F),
  Color(0xffD91448)
];

Color randomColor() {
  var rng = new Random();
  return colorsDM[rng.nextInt(colorsDM.length)];
  // return Color(0xffF25270);
}

//! Gece Modu Renkler

const darkmodeBg = Color(0xff303041);
const srcDark = Color(0xff1d1d1d);
const srcLight = Color(0xffE0E0E0);
const darkmodeAb = Color(0xff303041);
const kPrimaryColorDm = Color(0xffededed);

Color bgColor(bool isDark) {
  Color bgColor;
  if (isDark == true) {
    bgColor = Colors.black;
  } else if (isDark == false) {
    bgColor = Colors.white;
  }
  return bgColor;
}

IconData textIcon(bool isDark) {
  IconData textIcon;
  if (isDark == true) {
    textIcon = Icons.light_mode_outlined;
  } else if (isDark == false) {
    textIcon = Icons.dark_mode_outlined;
  }
  return textIcon;
}

Color srcColor(bool isDark) {
  Color srcColor;
  if (isDark == true) {
    srcColor = srcDark;
  } else if (isDark == false) {
    srcColor = srcLight;
  }
  return srcColor;
}

Color abColor(bool isDark) {
  Color abColor;
  if (isDark == true) {
    abColor = Colors.white;
  } else if (isDark == false) {
    abColor = kPrimaryColor;
  }
  return abColor;
}

Color otherColor(bool isDark) {
  Color otherColor;
  if (isDark == true) {
    otherColor = Colors.white;
  } else if (isDark == false) {
    otherColor = Colors.black;
  }
  return otherColor;
}
