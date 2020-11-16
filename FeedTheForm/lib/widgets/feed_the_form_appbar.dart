import 'package:flutter/material.dart';
import 'package:FeedTheForm/utils/colors.dart';

class FeedTheFormAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _FeedTheFormAppBarState createState() => _FeedTheFormAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FeedTheFormAppBarState extends State<FeedTheFormAppBar> {
  Widget customAppBarTitle = Container(
    alignment: Alignment.center,
    height: 50,
    child: Image.asset("assets/logo/logo.png"),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          customAppBarTitle,
        ],
      ),
      elevation: 0.0,
      backgroundColor: darkGray1,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: mainBlue,
          height: 4.0,
        ),
      ),
    );
  }
}
