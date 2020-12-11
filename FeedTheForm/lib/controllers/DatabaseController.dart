import 'package:FeedTheForm/Lecture.dart';

abstract class DatabaseController {
  bool isAdmin();

  String getCurrentUser();
}
