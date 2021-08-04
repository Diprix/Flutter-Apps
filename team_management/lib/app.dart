import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_management/constants.dart';
import 'package:team_management/pages/home.dart';
import 'package:team_management/services/authservice.dart';



class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Management',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.secularOneTextTheme(),
      ),
      home: AuthService().handleAuth(),
    );
  }
}
