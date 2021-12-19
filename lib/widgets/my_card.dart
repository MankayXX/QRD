import 'package:flutter/material.dart';
import 'package:qrd_qr_card_ui/constants/app_textstyle.dart';
import 'package:qrd_qr_card_ui/constants/color_constants.dart';
import 'package:qrd_qr_card_ui/data/card_data.dart';
import 'package:qrd_qr_card_ui/data/date_date.dart';
import 'package:qrd_qr_card_ui/screens/Setting_screen.dart';

class MyCard extends StatefulWidget {
  final CardModel card;
  const MyCard({Key key, this.card}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

String linklers(List link) {
  if (link.length > 1 && link.length <= 2) {
    return '${link[0]}, ${link[1]}'.toUpperCase();
  } else if (link.length > 2 && link.length <= 3) {
    return '${link[0]}, ${link[1]}, ${link[2]}'.toUpperCase();
  } else if (link.length > 3 && link.length <= 4) {
    return '${link[0]}, ${link[1]}, ${link[2]}, ${link[3]}'.toUpperCase();
  } else if (link.length > 4 && link.length <= 5) {
    return '${link[0]}, ${link[1]}, ${link[2]}, ${link[3]}, ${link[4]}'
        .toUpperCase();
  } else if (link.length == 1) {
    return '${link[0]}'.toUpperCase();
  } else {
    return '${link[0]}, ${link[1]}...'.toUpperCase();
  }
}

TextEditingController _textFieldController3 = TextEditingController();

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    var deneme = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: deneme.size.width - 40,
      decoration: BoxDecoration(
        color: widget.card.kartRenk,
        borderRadius: BorderRadius.circular(20),
      ),
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
                    "Kart İsmi",
                    style: ApptextStyle.MY_CARD_TITLE,
                  ),
                  Text(
                    widget.card.kartIsmi,
                    style: ApptextStyle.MY_CARD_SUBTITLE,
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Linkler", style: ApptextStyle.MY_CARD_TITLE),
                GestureDetector(
                  onTap: () {
                    //TODO tıklanan linki düzenlemek istiyorum
                    //String deneme = widget.card.linkler.toString();

                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            title: Text('Linkler'),
                            backgroundColor: bgColor(isDarkTheme),
                            content: Container(
                              width: double.minPositive,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.card.linkler.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(widget.card.linkler[index]),
                                    onTap: () {
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                                title: Text(
                                                    widget.card.linkler[index]),
                                                backgroundColor:
                                                    bgColor(isDarkTheme),
                                                content: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    TextField(
                                                        controller:
                                                            _textFieldController3,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "Link",
                                                          hintStyle: TextStyle(
                                                              color: otherColor(
                                                                  isDarkTheme)),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              otherColor(isDarkTheme))),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    randomColor()),
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                shape:
                                                                    new RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(10),
                                                                ),
                                                                primary:
                                                                    randomColor()),
                                                        child: Text(
                                                          "                        Kaydet                        ", //bu şekilde çözebildim xd
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          return showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                    backgroundColor:
                                                                        bgColor(
                                                                            isDarkTheme),
                                                                    content:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Text(
                                                                            "🛠 Bitmedi 🛠",
                                                                            style:
                                                                                TextStyle(color: Colors.red)),
                                                                        Text(
                                                                            "Link Ekranı",
                                                                            style:
                                                                                TextStyle(color: otherColor(isDarkTheme))),
                                                                      ],
                                                                    ));
                                                              });
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ));
                                          });
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(linklers(widget.card.linkler),
                      style: ApptextStyle.MY_CARD_SUBTITLE),
                )
              ]),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oluşturma Tarihi",
                        style: ApptextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        fullDate(),
                        style: ApptextStyle.MY_CARD_SUBTITLE,
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
