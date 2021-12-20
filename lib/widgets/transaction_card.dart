import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrd_qr_card_ui/constants/app_textstyle.dart';
import 'package:qrd_qr_card_ui/data/date_date.dart';
import 'package:qrd_qr_card_ui/data/transaction_data.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: srcColor(isDarkTheme),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("🛠 Bitmedi 🛠",
                          style: TextStyle(color: Colors.red)),
                      Text("Son İşlem Ekranı",
                          style: TextStyle(color: otherColor(isDarkTheme))),
                    ],
                  ));
            });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transaction.color,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/pictures/profile_pic.jpeg")),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction.name,
                      style: ApptextStyle.LISTTILE_TITLE,
                    ),
                    Text(
                      transaction.didWhat,
                      style: ApptextStyle.LISTTILE_SUB_TITLE,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tarih,
                      style: ApptextStyle.LISTTILE_TITLE,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          clock(),
                          style: ApptextStyle.LISTTILE_SUB_TITLE,
                        ),
                        SizedBox(width: 5),
                        Transform.scale(
                          scale: 0.8,
                          child: Icon(
                            FontAwesomeIcons.clock,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
