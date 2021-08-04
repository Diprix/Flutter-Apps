import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final String title;

  Settings(this.title);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Icon(Icons.settings)
        ),
    );
  }
}