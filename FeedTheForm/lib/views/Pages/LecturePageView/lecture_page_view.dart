import 'package:FeedTheForm/Lecture.dart';
import 'package:FeedTheForm/widgets/feed_the_form_appbar.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:FeedTheForm/widgets/profile_picture_and_name_row.dart';
import 'package:FeedTheForm/widgets/rate_button_page_view.dart';
import 'package:flutter/material.dart';

class LecturePageView extends StatelessWidget {
  LecturePageView(this.lectureInfo);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeedTheFormAppBar(),
      backgroundColor: Colors.black54,
      body: LecturePage(lectureInfo: lectureInfo),
    );
  }
}

class LecturePage extends StatelessWidget {
  const LecturePage({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    var column = Column(
      children: <Widget>[
        SizedBox(height: 10),
        Column(
          children: [
            BuildLectureNamePageView(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            BuildLecturerLectureView(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            BuildCalendarRowPageView(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            BuildDateRowPageView(lectureInfo: lectureInfo),
            BuildLocationRow(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            BuildLocationRow(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            BuildWordDescriptionPageView(),
          ],
        ),
        Divider(
          color: Colors.white,
          height: 10,
          thickness: 0.5,
          indent: 0,
          endIndent: 0,
        ),
        SizedBox(height: 5),
        Row(
          children: [
            BuildLectureDescriptionPageView(lectureInfo: lectureInfo),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShowRating(lectureInfo, MyController()),
          ],
        ),
      ],
    );
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: column,
      ),
    );
  }
}

class BuildLectureDescriptionPageView extends StatelessWidget {
  const BuildLectureDescriptionPageView({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Text(
          lectureInfo.description == null ? '' : lectureInfo.description,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class BuildWordDescriptionPageView extends StatelessWidget {
  const BuildWordDescriptionPageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Description",
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class BuildLocationRow extends StatelessWidget {
  const BuildLocationRow({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return IconAndInfoRow(
      "assets/icons/blue_maps-and-flags.png",
      lectureInfo.location,
    );
  }
}

class BuildDateRowPageView extends StatelessWidget {
  const BuildDateRowPageView({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return IconAndInfoRow(
      "assets/icons/blue_clock.png",
      lectureInfo.date.startHour + " - " + lectureInfo.date.endHour,
    );
  }
}

class BuildCalendarRowPageView extends StatelessWidget {
  const BuildCalendarRowPageView({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return IconAndInfoRow(
      "assets/icons/blue_calendar.png",
      lectureInfo.date.yearMonthDay,
    );
  }
}

class BuildLecturerLectureView extends StatelessWidget {
  const BuildLecturerLectureView({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return ProfilePictureAndNameRow(
      lectureInfo.lecturer.photo,
      lectureInfo.lecturer.name,
      15.0,
      16.0,
    );
  }
}

class BuildLectureNamePageView extends StatelessWidget {
  const BuildLectureNamePageView({
    Key key,
    @required this.lectureInfo,
  }) : super(key: key);

  final LectureInfo lectureInfo;

  @override
  Widget build(BuildContext context) {
    return Text(
      lectureInfo.lectureName == null ? '' : lectureInfo.lectureName,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
