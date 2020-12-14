import 'package:FeedTheForm/widgets/icon_and_info_row.dart';
import 'package:flutter/material.dart';

class ProfilePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/lecturers/avatar.jpg"),
                      child: Container(
                        margin: EdgeInsets.only(left: 75, top: 70),
                        child: Image.asset(
                          "assets/icons/black_pencil.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Test Subject",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "testsubject@gmail.com",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Change Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          labelStyle: TextStyle(
                            color: Colors.white12,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white12,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: TextStyle(
                            color: Colors.white12,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white12,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Confirm New Password',
                          labelStyle: TextStyle(
                            color: Colors.white12,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white12,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: double.maxFinite,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onPressed: () {},
                                color: Colors.grey[800],
                                textColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text("Update Password",
                                      style: TextStyle(fontSize: 14)),
                                )),
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "I forgot my password",
                            style: TextStyle(
                              color: Colors.blue[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          labelStyle: TextStyle(
                            color: Colors.white12,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white12,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () {},
                          color: Colors.red[900],
                          textColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text("Delete Account",
                                style: TextStyle(fontSize: 14)),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {},
                      color: Colors.blue[500],
                      textColor: Colors.white,
                      icon: IconAndInfoRow("assets/icons/white_logout.png", ""),
                      label: Text("Log Out", style: TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
