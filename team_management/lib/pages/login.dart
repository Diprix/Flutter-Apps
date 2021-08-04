import 'package:flutter/material.dart';
import 'package:team_management/widgets/signup.dart';

import '../constants.dart';
import '../widgets/signin.dart';

class Login extends StatefulWidget {
  final String? title;

  const Login({this.title, Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Option? selectedOption = Option.LogIn;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [

            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white
                ),
              ],
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Let's Kick Now !",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "It's easy and takes less than 30 seconds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [

                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 28,
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "HOME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.menu,
                  color: kPrimaryColor,
                  size: 28,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "Copyright 2020",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 1500),

              //Animation 1
              //transitionBuilder: (widget, animation) => RotationTransition(
              //  turns: animation,
              //  child: widget,
              //),
              //switchOutCurve: Curves.easeInOutCubic,
              //switchInCurve: Curves.fastLinearToSlowEaseIn,

              //Animation 2
              transitionBuilder: (widget, animation) =>
                  ScaleTransition(
                      child: widget,
                      scale: animation
                  ),

              child: selectedOption == Option.LogIn
                  ? LogIn(
                onSignUpSelected: () {
                  setState(() {
                    selectedOption = Option.SignUp;
                  });
                },
              )
                  : SignUp(
                onLogInSelected: () {
                  setState(() {
                    selectedOption = Option.LogIn;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
