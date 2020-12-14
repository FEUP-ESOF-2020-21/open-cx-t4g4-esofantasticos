import 'dart:collection';

class LectureInfo {
  String lectureName;
  Lecturer lecturer;
  Date date;
  String location;
  String description;
  int lectureCode;
  Map<String, double> ratings;

  LectureInfo(
    String lectureName,
    Lecturer lecturer,
    Date date,
    String location,
    String description,
    int lectureCode,
    Map<String, double> ratings,
  ) {
    this.lectureName = lectureName;
    this.lecturer = lecturer;
    this.date = date;
    this.location = location;
    this.description = description;
    this.lectureCode = lectureCode;
    this.ratings = ratings;
  }

  void addRating(String user, double rating) {
    ratings.update(user, (existingValue) => rating, ifAbsent: () => rating);
  }

  double getRatingAverage() {
    double average = 0;
    if(ratings.isNotEmpty) {
      ratings.forEach((key, value) {
        average += value;
      });
      average = average / ratings.length;
      return average;
    } else return null;
  }
}

class Lecturer {
  String name;
  String photo;

  Lecturer(
    String name,
    String photo,
  ) {
    this.name = name;
    this.photo = photo;
  }
}

class Date {
  String yearMonthDay;
  String startHour;
  String endHour;

  Date(
    String yearMonthDay,
    String startHour,
    String endHour,
  ) {
    this.yearMonthDay = yearMonthDay;
    this.startHour = startHour;
    this.endHour = endHour;
  }
}
