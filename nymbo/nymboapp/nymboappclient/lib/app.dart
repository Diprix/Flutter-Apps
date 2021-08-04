import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nymboappclient/routes/home/ui/home.dart';
import 'package:nymboappclient/routes/home/ui/settings.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //blocco in posizione portraitUp
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]);

    return MaterialApp(
      title: 'Music player screen',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.blue : null),

      home: home(),
      routes: <String, WidgetBuilder>{
        '/settings': (BuildContext context) => new Settings('Profilo'),
      },

    );
  }
}