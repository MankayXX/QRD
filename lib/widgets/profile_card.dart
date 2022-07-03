import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrd_qr_card_ui/Other_screens/theme_screen.dart';
import 'package:qrd_qr_card_ui/constants/app_textstyle.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/widgets/my_little_card.dart';
import 'package:units_converter/units_converter.dart';

class ProfileCard extends StatefulWidget {
  final CardModel profile_card;
  const ProfileCard({Key key, this.profile_card}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: srcColor(isDarkTheme),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                content: (Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 40,
                  child: MyLittleCard(
                    little_card: widget.profile_card,
                  ),
                )),
              );
            });
      },
      onDoubleTap: () {
        var convert = NumeralSystems()
          ..convert(
              NUMERAL_SYSTEMS.decimal, widget.profile_card.index.toString());
        QrImage qr = QrImage(
          data: convert.hexadecimal.stringValue,
          version: QrVersions.min,
          foregroundColor: otherColor(isDarkTheme),
        );
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: srcColor(isDarkTheme),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 200.0, height: 200.0, child: qr),
                    ],
                  ));
            });
      },
      child: Container(
        padding: EdgeInsets.all(20),
        height: 90,
        decoration: BoxDecoration(
            color: widget.profile_card.kartRenk,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.profile_card.kartIsmi,
              style: ApptextStyle.MY_CARD_SUBTITLE,
            ),
            Icon(FontAwesomeIcons.idCard, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
