import 'package:flutter/material.dart';

class Settingsbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        leading: Icon(Icons.settings),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
    );
  }
}
