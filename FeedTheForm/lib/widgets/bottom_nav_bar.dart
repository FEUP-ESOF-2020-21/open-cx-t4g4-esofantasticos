import 'package:FeedTheForm/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(int currentIndex, Function updateCurrentIndex) {
    this.currentIndex = currentIndex;
    this.updateCurrentIndex = updateCurrentIndex;
  }

  int currentIndex;
  Function updateCurrentIndex;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: darkGray2,
      currentIndex: widget.currentIndex,
      iconSize: 30.0,
      onTap: (index) {
        setState(() {
          widget.currentIndex = index;
        });
        widget.updateCurrentIndex(index);
      },
      selectedFontSize: 20.0,
      unselectedFontSize: 20.0,
      selectedItemColor: mainBlue,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/white_presentation.png'),
          ),
          label: "Lectures",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/white_ribbon.png'),
          ),
          label: "Prizes",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
                'assets/icons/white_round-account-button-with-user-inside.png'),
          ),
          label: "Account",
        ),
      ],
    );
  }
}
