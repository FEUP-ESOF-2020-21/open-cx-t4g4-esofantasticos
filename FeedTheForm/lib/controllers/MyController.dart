import 'package:FeedTheForm/Lecture.dart';
import 'DatabaseController.dart';

class MyController implements DatabaseController {
  @override
  bool isAdmin() {
    return false;
  }

  @override
  Future<void> addRating(LectureInfo lectureInfo, double rating) {
    // TODO: implement addRating
  }

  @override
  Future<void> changeRating() {
    // TODO: implement changeRating
  }
}
