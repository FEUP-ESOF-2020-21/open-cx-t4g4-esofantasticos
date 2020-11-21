import 'package:FeedTheForm/views/Pages/LecturePageView/lecture_page_view.dart';
import 'package:FeedTheForm/views/Pages/LecturesListingPageView/lectures_listing_page_view.dart';
import 'package:FeedTheForm/views/Pages/LoginPageView/login_page_view.dart';
import 'package:FeedTheForm/views/Pages/ProfilePageView/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:FeedTheForm/widgets/feed_the_form_appbar.dart';
import 'package:FeedTheForm/widgets/bottom_nav_bar.dart';
import 'package:FeedTheForm/utils/colors.dart';

class AppWrapper extends StatefulWidget {
  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final List<Widget> tabs = [
    LecturesListingPageView(),
    Center(
      child: Text(
        "Prizes",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    ),
    ProfilePageView(),
    LoginPageView(),
  ];

  int _currentIndex = 0;

  void updateCurrentIndex(int newCurrentIndex) {
    setState(() {
      _currentIndex = newCurrentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray1,
      appBar: FeedTheFormAppBar(),
      bottomNavigationBar: BottomNavBar(_currentIndex, updateCurrentIndex),
      body: tabs[3],
    );
  }
}
