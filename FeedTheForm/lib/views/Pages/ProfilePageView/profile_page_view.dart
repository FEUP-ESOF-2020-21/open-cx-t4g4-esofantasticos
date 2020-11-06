import 'package:flutter/material.dart';

class ProfilePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.centerLeft,
          child: Text("Change Password", style: TextStyle(color: Colors.white)),
        ));
  }
}
