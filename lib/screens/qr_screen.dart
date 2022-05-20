import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Other_screens/theme_screen.dart';
import '../constants/color_constants.dart';
import '../data/card_data.dart';
import '../widgets/my_little_card.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: qrdLogo(true),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 12, child: _buildQrView(context)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(Icons.flash_on, color: otherColor(isDarkTheme)),
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: IconButton(
                      icon: Icon(Icons.cameraswitch_rounded,
                          color: otherColor(isDarkTheme)),
                      onPressed: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderRadius: 30, borderLength: 0, borderWidth: 0, cutOutSize: 300.0),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  int sayac = 0;
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      sayac++;
      setState(() {
        result = scanData;
      });
      if (sayac == 1) {
        cardWiev(context, result).then((exit) => setState(() {
              sayac = 0;
            }));
      }
    });
  }

  cardWiev(context, result) {
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
                little_card: a(result),
              ),
            )),
          );
        });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

CardModel a(Barcode b) {
  int sayac = 0;
  for (int i = 0; i < myLittleCards.length; i++) {
    if (myLittleCards[i].index.toString() == b.code.toString()) {
      sayac++;
      return myLittleCards[i];
    }
  }
  if (sayac == 0) {
    return myLittleCards[0];
  }
}
