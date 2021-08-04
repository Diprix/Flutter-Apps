import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';
import 'package:flutter_ble/flutter_ble.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FlutterBle flutterBlue = FlutterBle.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speedometer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              var scanSubscription = flutterBlue.scan().listen((scanResult) {
                // do something with scan result
                print(scanResult.device.name);

              });

              scanSubscription.cancel();
            },
          )
        ],
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[

                SizedBox(height: 50,),

                Speedometer(
                  size: 300,
                  minValue: 0,
                  maxValue: 100,
                  currentValue: 43,
                  warningValue: 70,
                  backgroundColor: Colors.black,
                  meterColor: Colors.green,
                  warningColor: Colors.orange,
                  kimColor: Colors.white,
                  displayNumericStyle: TextStyle(
                      fontFamily: 'Digital-Display',
                      color: Colors.white,
                      fontSize: 40),
                  displayText: 'km/h',
                  displayTextStyle: TextStyle(color: Colors.white, fontSize: 15),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
