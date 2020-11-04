import 'package:flutter/material.dart';
import 'package:FeedTheForm/utils/colors.dart';
import 'package:FeedTheForm/views/app_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FeedTheForm',
      theme: getTheme(context),
      home: AppWrapper(),
    );
  }
}