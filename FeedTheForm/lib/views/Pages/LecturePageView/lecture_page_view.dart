import 'package:flutter/material.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:FeedTheForm/widgets/profile_picture_and_name_row.dart';
import 'package:FeedTheForm/Lecture.dart';

class LecturePageView extends StatelessWidget {
  static final Lecturer julieChoi = Lecturer(
    "Julie Choi",
    "assets/lecturers/julie_choi.jpg",
  );

  static final LectureInfo firstLecture = LectureInfo(
    "Applying AI to Real World Use Cases",
    julieChoi,
    Date("2020-10-02", "09:30", "10:30"),
    "B223",
    "The 2019 MIT AI Conference, the 3rd edition of this annual conference, focused on the Future of Computing - the rise of Artificial Intelligence and how innovators are leveraging AI to drive new use cases and chieve better outcomes across industries.",
  );

  final Map<String, LectureInfo> lecturesByDay = {
    "firstLecture": firstLecture,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: LecturePage(
          lecturesByDay["firstLecture"],
        ),
      ),
    );
  }
}

class LecturePage extends StatelessWidget {
  LecturePage(this.lectureInfo);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    lectureInfo.lectureName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ProfilePictureAndNameRow(
                    lectureInfo.lecturer.photo,
                    lectureInfo.lecturer.name,
                    15.0,
                    16.0,
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconAndInfoRow(
                    "assets/icons/blue_calendar.png",
                    lectureInfo.date.yearMonthDay,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconAndInfoRow(
                    "assets/icons/blue_clock.png",
                    lectureInfo.date.startHour +
                        " - " +
                        lectureInfo.date.endHour,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconAndInfoRow(
                    "assets/icons/blue_maps-and-flags.png",
                    lectureInfo.location,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        lectureInfo.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text('Rate'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
