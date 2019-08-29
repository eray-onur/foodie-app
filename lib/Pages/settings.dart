import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontFamily: "Montserrat")),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: SettingsWidget(),
      ),
    );
  }
}

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



