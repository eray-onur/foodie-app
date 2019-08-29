import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// Gets the scanned barcode data.
Future<String> getBarcodeData() async {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("white","Cancel", true);
  print(barcodeScanRes);
  return barcodeScanRes;
}