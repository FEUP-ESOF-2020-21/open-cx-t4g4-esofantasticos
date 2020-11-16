import 'package:FeedTheForm/widgets/feed_the_form_appbar.dart';
import 'package:flutter/material.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:FeedTheForm/widgets/profile_picture_and_name_row.dart';
import 'package:FeedTheForm/Lecture.dart';

class LecturePageView extends StatelessWidget {
  LecturePageView(this.lectureInfo);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeedTheFormAppBar(),
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
                    lectureInfo.lectureName == null
                        ? ''
                        : lectureInfo.lectureName,
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
                        lectureInfo.description == null
                            ? ''
                            : lectureInfo.description,
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
