import 'dart:ui';

import 'package:FeedTheForm/views/app_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

String loginEmail = "teste";
String loginPass = "teste";
String adminLoginEmail = "admin";
String adminLoginPass = "admin";

const invalid = TextStyle(
  color: Colors.red,
);

const valid = TextStyle(
  color: Colors.transparent,
);

class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  bool invalidCredentials = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/logo_with_name.png", height: 250),
                  ],
                ),
                SizedBox(height: 75),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "* Invalid credentials!",
                        style: invalidCredentials ? invalid : valid,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white38,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white38,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white38,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white38,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "I forgot my password",
                            style: TextStyle(
                              color: Colors.blue[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if(checkLogin(emailController.text, passwordController.text)) {
                                      invalidCredentials = false;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AppWrapper()),
                                      );
                                    } else {
                                      invalidCredentials = true;
                                      emailController.text = "";
                                      passwordController.text = "";
                                    }
                                  });
                                },
                                color: Colors.blue[600],
                                textColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text("Log In",
                                      style: TextStyle(fontSize: 14)),
                                )),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "New here?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign Up!",
                          style: TextStyle(
                            color: Colors.blue[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

bool checkLogin(String email, String pass) {
  if (email.compareTo(loginEmail) == 0 && pass.compareTo(loginPass) == 0) {
    // REGULAR LOGIN
    return true;
  } else if(email.compareTo(adminLoginEmail) == 0 && pass.compareTo(adminLoginPass) == 0) {
    // ADMIN LOGIN
    return true;
  } else {
    // FAILED LOGIN
    return false;
  }
}