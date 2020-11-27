import 'package:FeedTheForm/widgets/feed_the_form_appbar.dart';
import 'package:flutter/material.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:FeedTheForm/widgets/profile_picture_and_name_row.dart';
import 'package:FeedTheForm/Lecture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Column(
              children: [
                buildLectureName(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildProfilePictureAndNameRow(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildCalendarRow(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildDateRow(),
                buildLocationRow(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildLocationRow(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildWordDescription(),
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
                buildLectureDescription(),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildRateButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text buildLectureName() {
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

  ProfilePictureAndNameRow buildProfilePictureAndNameRow() {
    return ProfilePictureAndNameRow(
      lectureInfo.lecturer.photo,
      lectureInfo.lecturer.name,
      15.0,
      16.0,
    );
  }

  IconAndInfoRow buildDateRow() {
    return IconAndInfoRow(
      "assets/icons/blue_clock.png",
      lectureInfo.date.startHour + " - " + lectureInfo.date.endHour,
    );
  }

  IconAndInfoRow buildCalendarRow() {
    return IconAndInfoRow(
      "assets/icons/blue_calendar.png",
      lectureInfo.date.yearMonthDay,
    );
  }

  IconAndInfoRow buildLocationRow() {
    return IconAndInfoRow(
      "assets/icons/blue_maps-and-flags.png",
      lectureInfo.location,
    );
  }

  Text buildWordDescription() {
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

  Flexible buildLectureDescription() {
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

  RaisedButton buildRateButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        buildShowRateDialog(context);
      },
      child: Text('Rate'),
    );
  }

  Future<void> buildShowRateDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: buildLectureCodeField(),
          content: buildStarRatingBar(),
          actions: <Widget>[
            buildCancelButton(context),
            buildRateSumbissionButton(context),
          ],
          backgroundColor: Colors.black,
        );
      },
    );
  }

  TextFormField buildLectureCodeField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'Lecture Code',
        labelStyle: TextStyle(
          color: Colors.white24,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white24,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildStarRatingBar() {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          RatingBar(
            initialRating: 3,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: Image.asset('assets/icons/star.png'),
              half: Image.asset(''),
              empty: Image.asset('assets/icons/grey_star.png'),
            ),
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ],
      ),
    );
  }

  TextButton buildCancelButton(BuildContext context) {
    return TextButton(
      child: Text(
        'Cancel',
        style: TextStyle(
          color: Colors.white38,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  TextButton buildRateSumbissionButton(BuildContext context) {
    return TextButton(
      child: Text('Rate'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
