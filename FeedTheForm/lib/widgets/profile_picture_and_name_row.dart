import 'package:flutter/material.dart';

class ProfilePictureAndNameRow extends StatelessWidget {
  String photo, name;
  double photoRadius, nameFontSize;

  ProfilePictureAndNameRow(
    String photo,
    String name,
    double photoRadius,
    double nameFontSize,
  ) {
    this.photo = photo;
    this.name = name;
    this.photoRadius = photoRadius;
    this.nameFontSize = nameFontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(
            photo == null
                ? 'assets/icons/blue_round-account-button-with-user-inside.png'
                : photo,
          ),
          radius: photoRadius,
        ),
        SizedBox(
          width: 0.5 * photoRadius,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: nameFontSize,
          ),
        ),
      ],
    );
  }
}
