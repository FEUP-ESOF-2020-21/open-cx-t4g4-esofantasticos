import 'package:flutter/material.dart';

class IconAndInfoRow extends StatelessWidget {
  String iconPath, iconInfo;

  IconAndInfoRow(
    String iconPath,
    String iconInfo,
  ){
    this.iconPath = iconPath;
    this.iconInfo = iconInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 18.0,
          child: Image.asset(iconPath),
        ),
        SizedBox(
          width: 7.0,
        ),
        Text(
          iconInfo,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ],
    );
  }
}
