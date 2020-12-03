import 'package:FeedTheForm/Lecture.dart';

abstract class DatabaseController {
  bool isAdmin();

  Future<void> addRating(LectureInfo lectureInfo, double rating);

  Future<void> changeRating();
}
