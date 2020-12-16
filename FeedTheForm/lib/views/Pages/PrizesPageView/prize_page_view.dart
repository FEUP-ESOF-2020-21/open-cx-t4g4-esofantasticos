import 'dart:io';

import 'package:FeedTheForm/controllers/MyController.dart';
import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:flutter/material.dart';

class PrizePageView extends StatelessWidget {
  final MyController dbController;

  PrizePageView(this.dbController);

  TextEditingController prize1 = new TextEditingController();
  TextEditingController prize2 = new TextEditingController();
  TextEditingController prize3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    int prizeID1 = 1;
    int prizeID2 = 2;
    int prizeID3 = 3;
    prize1.text = "Winner: " + dbController.getPrizeWinner(prizeID1);
    prize2.text = "Winner: " + dbController.getPrizeWinner(prizeID2);
    prize3.text = "Winner: " + dbController.getPrizeWinner(prizeID3);
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
                          child: TextField(
                            controller: prize1,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (dbController.isAdmin()) Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              String winner = dbController.generateWinner(prizeID1);
                              if(winner != null) prize1.text = "Winner: " + winner + "!";
                              else {
                                prize1.text = "Insufficient ratings!";
                                Future.delayed(const Duration(seconds: 2), () {
                                  prize1.text = "Winner: To be announced";
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Generate winner",
                              style: TextStyle(
                                color: Colors.blue[600],
                              ),
                            ),
                          ),
                        ),
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
                          child: TextField(
                            controller: prize2,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (dbController.isAdmin()) Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              String winner = dbController.generateWinner(prizeID2);
                              if(winner != null) prize2.text = "Winner: " + winner + "!";
                              else {
                                prize2.text = "Insufficient ratings!";
                                Future.delayed(const Duration(seconds: 2), () {
                                  prize2.text = "Winner: To be announced";
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Generate winner",
                              style: TextStyle(
                                color: Colors.blue[600],
                              ),
                            ),
                          ),
                        ),
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
                          child: TextField(
                            controller: prize3,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (dbController.isAdmin()) Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              String winner = dbController.generateWinner(prizeID3);
                              if(winner != null) prize3.text = "Winner: " + winner + "!";
                              else {
                                prize3.text = "Insufficient ratings!";
                                Future.delayed(const Duration(seconds: 2), () {
                                  prize3.text = "Winner: To be announced";
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid
                            ), borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Generate winner",
                              style: TextStyle(
                                color: Colors.blue[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
