import 'package:flutter/material.dart';
import 'package:food_finder/main.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrGenerator extends StatefulWidget {
  @override
  _QrGeneratorState createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  bool canSendNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
          child: Container(
              child: QrImage(
                data: "Allah",
                version: QrVersions.auto,
                size: 200.0,
              ),
          )
      ),
    );
  }
}
