import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Flutter_qr_Generate extends StatefulWidget {
  const Flutter_qr_Generate({Key key}) : super(key: key);

  @override
  _Flutter_qr_GenerateState createState() => _Flutter_qr_GenerateState();
}

class _Flutter_qr_GenerateState extends State<Flutter_qr_Generate> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 200,
              ),
              SizedBox(
                height: 40,
              ),
              buildTextField(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return TextField(
      controller: controller,
    decoration: InputDecoration(
      suffixIcon: IconButton(onPressed: (){
        setState(() {
          
        });
      }, icon: Icon(Icons.done))
    ),
    );
  }
}
