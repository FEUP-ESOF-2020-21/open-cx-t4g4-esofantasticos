import 'package:FeedTheForm/controllers/MyController.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:flutter/material.dart';

class PrizePageView extends StatelessWidget {
  final MyController dbController;

  PrizePageView(this.dbController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Máscara Universidade do Porto",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Image.asset(
                                    "assets/prizes/uporto_mascara.jpg",
                                    fit: BoxFit.fitWidth))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Winner: To be announced",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Sweater Universidade do Porto",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Image.asset(
                                    "assets/prizes/uporto_sweater.jpg",
                                    fit: BoxFit.fitWidth))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Winner: To be announced",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "T-Shirt Universidade do Porto",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Image.asset(
                                    "assets/prizes/uporto_tshirt.jpg",
                                    fit: BoxFit.fitWidth))),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Winner: To be announced",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ],
                ))));
  }
}
