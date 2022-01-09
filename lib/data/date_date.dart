var now = DateTime.now();
String tarih = "${now.day}.${now.month}.${now.year}";

String fullDate() {
  String tamTarih;
  if (now.minute < 10 && now.hour < 10 && now.day < 10 && now.month < 10) {
    tamTarih =
        "0${now.day}.0${now.month}.${now.year} 0${now.hour}:0${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour > 10 &&
      now.day > 10 &&
      now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour < 10 &&
      now.day > 10 &&
      now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute < 10 &&
      now.hour > 10 &&
      now.day > 10 &&
      now.month > 10) {
    tamTarih = "${now.day}.${now.month}.${now.year} ${now.hour}:0${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour > 10 &&
      now.day < 10 &&
      now.month > 10) {
    tamTarih = "0${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour > 10 &&
      now.day > 10 &&
      now.month < 10) {
    tamTarih = "${now.day}.0${now.month}.${now.year} ${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute < 10 &&
      now.hour < 10 &&
      now.day > 10 &&
      now.month > 10) {
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
  } else if (now.minute < 10 &&
      now.hour > 10 &&
      now.day > 10 &&
      now.month < 10) {
    tamTarih =
        "${now.day}.0${now.month}.${now.year} ${now.hour}:0${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour < 10 &&
      now.day < 10 &&
      now.month > 10) {
    tamTarih =
        "0${now.day}.${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour < 10 &&
      now.day > 10 &&
      now.month < 10) {
    tamTarih =
        "${now.day}.0${now.month}.${now.year} 0${now.hour}:${now.minute}";
    return tamTarih;
  } else if (now.minute > 10 &&
      now.hour > 10 &&
      now.day < 10 &&
      now.month < 10) {
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
