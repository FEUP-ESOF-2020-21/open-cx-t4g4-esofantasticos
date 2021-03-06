import 'dart:collection';

import 'package:FeedTheForm/controllers/MyController.dart';
import 'package:flutter/material.dart';
import 'package:FeedTheForm/utils/colors.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:FeedTheForm/widgets/profile_picture_and_name_row.dart';
import 'package:FeedTheForm/Lecture.dart';
import 'package:FeedTheForm/utils/get_weekday_name.dart';
import 'package:FeedTheForm/utils/get_month_name.dart';
import 'package:FeedTheForm/views/Pages/LecturePageView/lecture_page_view.dart';

class LecturesListingPageView extends StatelessWidget {
  static final Lecturer julieChoi = Lecturer(
    "Julie Choi",
    "assets/lecturers/julie_choi.jpg",
  );
  static final Lecturer ajitDivakaruni = Lecturer(
    "Ajit Divakaruni",
    "assets/lecturers/ajit_divakaruni.jpeg",
  );
  static final Lecturer anuragPurwar = Lecturer(
    "Anurag Purwar",
    null,
  );

  //ESTES HARDCODED RATINGS TAMBÉM TEM DE ESTAR NO DBCONTROLLER, HARDCODE LÁ TB, SIGA

  static final LectureInfo firstLecture = LectureInfo(
    "Applying AI to Real World Use Cases",
    julieChoi,
    Date("2020-10-02", "09:30", "10:30"),
    "B223",
    "The 2019 MIT AI Conference, the 3rd edition of this annual conference, focused on the Future of Computing - the rise of Artificial Intelligence and how innovators are leveraging AI to drive new use cases and chieve better outcomes across industries.",
    1234,
    {'user1': 2, 'user2': 1, 'user3': 5},
  );

  static final LectureInfo secondLecture = LectureInfo(
    "Targeting Metabolism to Treat the Aging Brain",
    ajitDivakaruni,
    Date("2020-10-04", "08:30", "10:00"),
    "B015",
    null,
    2345,
    {'user1': 5, 'user2': 4, 'user3': 5},
  );

  static final LectureInfo thirdLecture = LectureInfo(
    "Machine design innovation through technology and education",
    anuragPurwar,
    Date("2020-10-04", "11:00", "12:30"),
    "B104",
    null,
    3456,
    {'user1': 2, 'user2': 1, 'user3': 3},
  );

  final List<Map> lecturesByDay = [
    {
      "yearMonthDay": "2020-10-02",
      "lectures": [firstLecture]
    },
    {
      "yearMonthDay": "2020-10-04",
      "lectures": [secondLecture, thirdLecture]
    },
  ];

  LecturesListingPageView(this.dbController);

  final MyController dbController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
      child: ListView.builder(
        itemCount: lecturesByDay.length,
        itemBuilder: (context, index) {
          return LecturesInTheSameDayListing(
            context,
            lecturesByDay[index]["yearMonthDay"],
            lecturesByDay[index]["lectures"],
              dbController,
          );
        },
      ),
    );
  }
}

class LecturesInTheSameDayListing extends StatelessWidget {
  BuildContext context;
  DateTime dateTime;
  List<LectureInfo> lecturesInfo;
  MyController dbController;

  LecturesInTheSameDayListing(
    BuildContext context,
    String yearMonthDay,
    List<LectureInfo> lecturesInfo,
      MyController dbController,
  ) {
    this.context = context;
    this.dateTime = DateTime.parse(yearMonthDay);
    this.lecturesInfo = lecturesInfo;
    this.dbController = dbController;
  }

  @override
  Widget build(BuildContext context) {
    print(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          getWeekdayName(dateTime.weekday) +
              ", " +
              getMonthName(dateTime.month) +
              " " +
              dateTime.day.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: lecturesInfo
              .map((lectureInfo) => LectureCard(lectureInfo, dbController))
              .toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class LectureCard extends StatelessWidget {
  LectureCard(this.lectureInfo, this.dbController);

  final LectureInfo lectureInfo;
  final MyController dbController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: darkGray2,
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LecturePageView(lectureInfo, dbController)),
          )
        },
        /* Navigator.pushNamed(context, '/subject') */
        // raio de 4.0 porque é o default radius do Card
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfilePictureAndNameRow(
                lectureInfo.lecturer.photo,
                lectureInfo.lecturer.name,
                15.0,
                16.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                lectureInfo.lectureName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  IconAndInfoRow(
                    "assets/icons/blue_clock.png",
                    lectureInfo.date.startHour +
                        " - " +
                        lectureInfo.date.endHour,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  IconAndInfoRow(
                    "assets/icons/blue_maps-and-flags.png",
                    lectureInfo.location,
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
