import 'package:barbar/barcodeGenerate.dart';
import 'package:barbar/barcodeScanner.dart';
import 'package:barbar/flutter_qr_generate.dart';
import 'package:barbar/qr_scanner_page.dart';
// import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Flutter_qr_Generate()));
              },
              child: Text("Generate Barcode"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrScannerPage()));
              },
              child: Text("Scan barCode"),
            )
          ],
        ),
      ),
    );
  }
}
