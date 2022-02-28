var now = DateTime.now();
String tarih = "${now.day}.${now.month}.${now.year}";

String fullDate() {
  String tamTarih;
  // her şey 10 dan küçük ise
  if (now.minute < 10 && now.hour < 10 && now.day < 10 && now.month < 10) {
    tamTarih =
        "0${now.day}.0${now.month}.${now.year} 0${now.hour}:0${now.minute}";
    return tamTarih;
  }
  // her eşy 10 dan büyük ise
  else if (now.minute > 10 && now.hour > 10 && now.day > 10 && now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  }
  // sadece saat 10 dan küçük ise
  else if (now.minute > 10 && now.hour < 10 && now.day > 10 && now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  }
  // sadece dakika 10 dan küçük ise
  else if (now.minute < 10 && now.hour > 10 && now.day > 10 && now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} ${now.hour}:0${now.minute}";
    return tamTarih;
  }
  // sadece gün 10 dan küçük ise
  else if (now.minute > 10 && now.hour > 10 && now.day < 10 && now.month > 10) {
    tamTarih = "0${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  }
  //sadece ay 10 dan küçük ise
  else if (now.minute > 10 && now.hour > 10 && now.day > 10 && now.month < 10) {
    tamTarih = "${now.day}.0${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  }
  // hem saat hem dakika 10 dan küçük ise
  else if (now.minute < 10 && now.hour < 10 && now.day > 10 && now.month > 10) {
    tamTarih =
        "${now.day}.${now.month}.${now.year} 0${now.hour}:0${now.minute}";
    return tamTarih;
  } else if (now.minute < 10 &&
      now.hour > 10 &&
      now.day < 10 &&
      now.month > 10) {
    tamTarih =
        "0${now.day}.${now.month}.${now.year} ${now.hour}:0${now.minute}";
    return tamTarih;
  }
  // hem ay hem de dakika 10 dan küçük ise
  else if (now.minute < 10 && now.hour > 10 && now.day > 10 && now.month < 10) {
    tamTarih =
        "${now.day}.0${now.month}.${now.year} ${now.hour}:0${now.minute}";
    return tamTarih;
  }
  // hem gün hem de saat 10 dan küçük ise
  else if (now.minute > 10 && now.hour < 10 && now.day < 10 && now.month > 10) {
    tamTarih =
        "0${now.day}.${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  }
  // hem ay hem de saat 10 dan küçük ise
  else if (now.minute > 10 && now.hour < 10 && now.day > 10 && now.month < 10) {
    tamTarih =
        "${now.day}.0${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  }
  //hem gün hem de ay hel de saat 10 dan küçük ise
  else if (now.minute > 10 && now.hour > 10 && now.day < 10 && now.month < 10) {
    tamTarih =
        "0${now.day}.0${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  } else {
    tamTarih = "${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  }
}

String clock() {
  String saat;
  if (now.hour < 10 && now.minute < 10) {
    saat = "0${now.hour}:0${now.minute}";
    return saat;
  } else if (now.hour < 10) {
    saat = "0${now.hour}:${now.minute}";
    return saat;
  } else if (now.minute < 10) {
    saat = "${now.hour}:0${now.minute}";
    return saat;
  } else {
    saat = "${now.hour}:${now.minute}";
    return saat;
  }
}
