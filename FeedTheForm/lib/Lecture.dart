class LectureInfo {
  String lectureName;
  Lecturer lecturer;
  Date date;
  String location;
  String description;

  LectureInfo(
    String lectureName,
    Lecturer lecturer,
    Date date,
    String location,
    String description,
  ) {
    this.lectureName = lectureName;
    this.lecturer = lecturer;
    this.date = date;
    this.location = location;
    this.description = description;
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
