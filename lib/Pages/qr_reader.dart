import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:food_finder/styles/textstyles.dart';
class QrReader extends StatefulWidget {
  @override
  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  bool canSendNotifications = false;
  String decodedBarcodeInfo = "";
  Future<String> getShit() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("red","Cancel", true);
    print(barcodeScanRes);
    return barcodeScanRes;
  }
  Widget renderBarcodeInfo() {
    if(decodedBarcodeInfo == "") {
      return CircularProgressIndicator(backgroundColor: Colors.white70, strokeWidth: 10.0,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),);
    }
    else {

      return Text(decodedBarcodeInfo, style: cardTextStyle,);
    }
  }
  @override
  void initState() {
    super.initState();
    getShit().then((val) {
      setState(() {
        decodedBarcodeInfo = val;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Reader'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            child: renderBarcodeInfo(),
          )
      ),
    );
  }
}
