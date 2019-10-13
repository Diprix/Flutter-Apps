
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nymboappclient/routes/home/ui/home.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response = await http.post(path + 'api/auth/signin', body: {
      "username": user.text,
      "password": pass.text,
    });


    var datauser = json.decode(response.body);

    print(datauser);

    if (datauser.length == 0) {
      setState(() {
        msg = 'Email o Password Errati';
      });
    } else {
      setState(() {
        user = datauser[0]['nome'];
      });
    }
    return datauser[0]['nome'];
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text("Username", style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: user,
                  decoration: InputDecoration(
                      hintText: 'Username'
                  ),
                ),
                Text("Password", style: TextStyle(fontSize: 18.0),),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password'
                  ),
                ),

                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    _login();
                    Navigator.pop(context);
                  },
                ),

                Text(msg, style: TextStyle(fontSize: 20.0, color: Colors.red),)


              ],
            ),
          ),
        ),
      );
    }
}