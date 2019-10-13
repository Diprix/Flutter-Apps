import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'home.dart';

//void main() {
//  runApp(
//    MaterialApp(
//      title: 'Reading and Writing Files',
//      home: FlutterDemo(storage: CounterStorage()),
//    ),
//  );
//}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class Settings extends StatefulWidget {
  final CounterStorage storage;

  Settings({Key key, @required this.storage}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _counter;

  @override
  void initState() {
    super.initState();
      widget.storage.readCounter().then((String value) {
      setState(() {
        idUser = value;
      });
    });
  }

  Future<File> _incrementCounter(value) {
    setState(() {
      _counter = value;
      idUser = value;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
            children: <Widget>[
              TextFormField(
                onFieldSubmitted: (String value) {
                  _incrementCounter(value);
                },
                decoration: InputDecoration(
                  labelText: 'User: $idUser'
                ),
              ),
            ],


      )
    );
  }
}