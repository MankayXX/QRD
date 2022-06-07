import 'package:flutter/material.dart';
import 'dart:math';

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
var i = 0;

Color randomColor() {
  i++;
  if (i < colorsLM.length) {
    return colorsLM[i];
  } else if (i == colorsLM.length) {
    i = -1;
  }
}

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

Image qrdLogo(bool isDark) {
  Image qrdLogo;
  if (isDark == true) {
    qrdLogo = Image.asset('assets/logo/qrd_logo_white.png',
        fit: BoxFit.contain, height: 23);
  } else if (isDark == false) {
    qrdLogo = Image.asset('assets/logo/qrd_logo_black.png',
        fit: BoxFit.contain, height: 23);
  }
  return qrdLogo;
}

IconData textIcon(bool isDark) {
  IconData textIcon;
  if (isDark == false) {
    textIcon = Icons.light_mode_outlined;
  } else if (isDark == true) {
    textIcon = Icons.dark_mode_outlined;
  }
  return textIcon;
}

String username(bool girdi_mi) {
  String username;
  if (girdi_mi == true) {
    username = "mankay.xx";
  } else if (girdi_mi == false) {
    username = "deneme";
  }
  return username;
}

String picture(bool girdi_mi) {
  String picture;
  if (girdi_mi == true) {
    picture = "assets/pictures/profile_pic.jpeg";
  } else if (girdi_mi == false) {
    picture = "assets/pictures/blank-pp.jpeg";
  }
  return picture;
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

Color switchColor(bool isDark) {
  Color switchColor;
  if (isDark == true) {
    switchColor = Colors.white;
  } else if (isDark == false) {
    switchColor = randomColor();
  }
  return switchColor;
}

Color shadowColor(bool isDark) {
  var rngs = new Random();
  Color shadowColor;
  if (isDark == true) {
    shadowColor = colorsLM[rngs.nextInt(colorsLM.length)];
  } else if (isDark == false) {
    shadowColor = colorsLM[rngs.nextInt(colorsLM.length)];
  }
  return shadowColor;
}
