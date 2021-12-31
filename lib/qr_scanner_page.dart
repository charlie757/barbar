import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key key}) : super(key: key);

  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode barcode;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buidlQrView(context),
            Positioned(bottom: 10, child: buildResult()),
            Positioned(top: 10, child: buildControlButtons())
          ],
        ),
      ),
    );
  }

  Widget buildControlButtons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: FutureBuilder<bool>(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(snapshot.data ? Icons.flash_on : Icons.flash_off);
              } else {
                return Container();
              }
            },
          ),
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {});
          },
        ),
        IconButton(
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {});
          },
          icon: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(Icons.switch_camera);
                } else {
                  return Container();
                }
              }),
        )
      ],
    );
  }

  Widget buildResult() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Text(
          barcode != null ? 'Result : ${barcode.code}' : 'Scan a code!',
          maxLines: 3,
        ));
  }

  Widget buidlQrView(BuildContext context) {
    return QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
            borderWidth: 10,
            borderLength: 20,
            borderRadius: 10,
            borderColor: Theme.of(context).accentColor));
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
