// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class BarCodeScanner extends StatefulWidget {
//   const BarCodeScanner({Key key}) : super(key: key);

//   @override
//   _BarCodeScannerState createState() => _BarCodeScannerState();
// }

// class _BarCodeScannerState extends State<BarCodeScanner> {
//   String scanResult;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//                 onPressed: scanBarCode,
//                 icon: Icon(Icons.camera_alt_outlined),
//                 label: Text("Start scna")),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               scanResult == null ? "scan a code!" : "scan result: $scanResult",
//               style: TextStyle(fontSize: 18),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future scanBarCode() async {
//     String scanResult;
//     try {
//       scanResult = await FlutterBarcodeScanner.scanBarcode(
//           "#ff6666", "cancel", true, ScanMode.BARCODE);
//     } on PlatformException {
//       scanResult = "Faild to get plateform version";
//     }
//     if (!mounted) return;
//     setState(() {
//       this.scanResult = scanResult;
//     });
//   }
// }
