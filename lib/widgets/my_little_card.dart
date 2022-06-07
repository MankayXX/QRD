import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/app_textstyle.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import '../data/transaction_data.dart';

class MyLittleCard extends StatefulWidget {
  final CardModel little_card;
  const MyLittleCard({Key key, this.little_card}) : super(key: key);

  @override
  State<MyLittleCard> createState() => _MyLitteCardState();
}

String linklers(List link) {
  int sum = 0;
  for (int i = 0; i < link.length; i++) {
    sum += link[i].length;
  }
  if (link.length == 2 && sum < 15) {
    return '${link[0]}, ${link[1]}'.toUpperCase();
  } else if (link.length == 3 && sum < 15) {
    return '${link[0]}, ${link[1]}, ${link[2]}'.toUpperCase();
  } else if (link.length == 4 && sum < 15) {
    return '${link[0]}, ${link[1]}, ${link[2]}, ${link[3]}'.toUpperCase();
  } else if (link.length == 5 && sum < 15) {
    return '${link[0]}, ${link[1]}, ${link[2]}, ${link[3]}, ${link[4]}'
        .toUpperCase();
  } else if (link.length == 1 && sum < 15) {
    return '${link[0]}'.toUpperCase();
  } else {
    return '${link[0]} ...'.toUpperCase();
  }
}

TextEditingController _textFieldController3 = TextEditingController();
int tik = 0;

class _MyLitteCardState extends State<MyLittleCard> {
  @override
  Widget build(BuildContext context) {
    var ekran = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        var isim = widget.little_card.kartIsmi;
        var linkler = widget.little_card.linkler;
        var renk = widget.little_card.kartRenk;
        addExistCard(isim, linkler, renk);
        addTransactionModel('Bir kart ekledi');
        Navigator.of(context).pop();
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        decoration: BoxDecoration(
            color: widget.little_card.kartRenk,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "kart İsmi",
                      style: ApptextStyle.MY_CARD_TITLE,
                    ),
                    Text(
                      widget.little_card.kartIsmi,
                      style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Linkler", style: ApptextStyle.MY_CARD_TITLE),
                  Text(linklers(widget.little_card.linkler),
                      style: ApptextStyle.MY_CARD_SUBTITLE)
                ]),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kart Sahibi",
                          textAlign: TextAlign.right,
                          style: ApptextStyle.MY_CARD_TITLE,
                        ),
                        Text(
                          "Mert Mankay",
                          textAlign: TextAlign.right,
                          style: ApptextStyle.MY_CARD_SUBTITLE,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
