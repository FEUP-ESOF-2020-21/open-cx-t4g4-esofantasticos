import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:open_cx/program/Model/Talk.dart';
import 'package:open_cx/networking/view/theme.dart';
import 'package:open_cx/program/Screens/Program/Askkit/Controllers/DatabaseController.dart';

// ignore: non_constant_identifier_names
Widget ShowRating(Talk talk, DatabaseController dbcontroller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      if (dbcontroller.isAdmin()) RatingInformation(talk: talk),
      RateButtonPageView(talk, dbcontroller),
    ],
  );
}

class RatingInformation extends StatelessWidget {
  final Talk talk;

  const RatingInformation({Key key, this.talk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.only(top: 15, bottom: 15, left: 20.0, right: 15.0),
            color: Color(0xffEFEFEF),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rating: ",
                  style: TextStyle(fontSize: 20.0, color: Color(0xff6B6B6B)),
                ),
                Text(
                  talk.ratingAverage.toString(),
                  style: TextStyle(fontSize: 20.0, color: blackColor),
                ),
                Image.asset(
                  'assets/images/star.png',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RateButtonPageView extends StatefulWidget {
  final DatabaseController dbcontroller;
  final Talk talk;

  const RateButtonPageView(this.talk, this.dbcontroller) : super();

  @override
  _RateButtonPageViewState createState() =>
      _RateButtonPageViewState(talk, dbcontroller);
}

class _RateButtonPageViewState extends State<RateButtonPageView> {
  final DatabaseController dbcontroller;
  final Talk talk;

  double rating;

  _RateButtonPageViewState(this.talk, this.dbcontroller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              buildShowRateDialog(context);
            },
            child: Text('Rate'),
          ),
        )
      ],
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
            Row(
              children: [
                buildCancelButton(context),
                buildRateSumbissionButton(context),
              ],
            )
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
      child: RatingBar(
        initialRating: 3,
        minRating: 0,
        allowHalfRating: false,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: Image.asset('assets/images/star.png'),
          half: Image.asset(''),
          empty: Image.asset('assets/images/grey_star.png'),
        ),
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        onRatingUpdate: (rating) {
          this.rating = rating;
        },
        updateOnDrag: true,
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
        dbcontroller.addRating(talk, rating);
        Navigator.of(context).pop();
      },
    );
  }
}
