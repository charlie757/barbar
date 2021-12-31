// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:flutter/material.dart';

// class BarCodeGenerate extends StatefulWidget {
//   const BarCodeGenerate({ Key key }) : super(key: key);

//   @override
//   _BarCodeGenerateState createState() => _BarCodeGenerateState();
// }

// class _BarCodeGenerateState extends State<BarCodeGenerate> {
//     final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Generate BarCode"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Card(
//               elevation: 6,
//               shadowColor: Colors.amber,
//                 color: Colors.white,
//                 child: Padding(
//                     padding: EdgeInsets.all(16),
//                     child: BarcodeWidget(
//                       data: controller.text,
//                       barcode: Barcode.code128(),
//                       width: 200,
//                       height: 200,
//                       drawText: false,
//                     ))),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 22),
//               child: buildTextField(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(BuildContext context) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//       ),
//       onSubmitted: (_) {
//         setState(() {});
//       },
//       decoration: InputDecoration(
//         hintText: "Enter the data",
//         hintStyle: TextStyle(color: Colors.grey),
//       ),
//     );
//   }
// }
