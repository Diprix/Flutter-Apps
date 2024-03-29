import 'package:flutter/material.dart';

import 'package:team_management/widgets/action_button.dart';

import '../constants.dart';

class SignUp extends StatefulWidget {

  final Function? onLogInSelected;

  SignUp({@required this.onLogInSelected});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = new GlobalKey<FormState>();

  String? email, password;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Padding(
      padding: EdgeInsets.all(size.height > 770 ? 64 : size.height > 670 ? 32 : 16),
      child: Form(
        key: formKey,
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: size.height * (size.height > 770 ? 0.7 : size.height > 670 ? 0.8 : 0.9),
              width: 500,
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          width: 30,
                          child: Divider(
                            color: kPrimaryColor,
                            thickness: 2,
                          ),
                        ),

                        SizedBox(
                          height: 32,
                        ),

                        /*TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            labelText: 'Name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                            ),
                          ),
                            onChanged: (value) {
                              this.name = value;
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Email is required' : validateEmail(value)
                        ),

                        SizedBox(
                          height: 32,
                        ),*/

                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                            onChanged: (value) {
                              this.email = value;
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Email is required' : validateEmail(value)
                        ),

                        SizedBox(
                          height: 32,
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                            obscureText: true,
                            onChanged: (value) {
                              this.password = value;
                            },
                            validator: (value) =>
                            value!.isEmpty ? 'Password is required' : null
                        ),

                        SizedBox(
                          height: 64,
                        ),

                        GestureDetector(
                            onTap: () {

                            },
                            child: actionButton("Create Account")),

                        SizedBox(
                          height: 32,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            GestureDetector(
                              onTap: () {
                                widget.onLogInSelected!();
                              },
                              child: Row(
                                children: [

                                  Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(
                                    width: 8,
                                  ),

                                  Icon(
                                    Icons.arrow_forward,
                                    color: kPrimaryColor,
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}