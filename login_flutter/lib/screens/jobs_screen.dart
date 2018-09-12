import 'package:flutter/material.dart';

class Jobs extends StatefulWidget {
  final String strUsername;
  final String strPassword;
  final Map<String, dynamic> arrJobList;

  Jobs({Key key, this.strUsername, this.strPassword, this.arrJobList})
      : super(key: key);
  @override
  JobState createState() => new JobState();
}

class JobState extends State<Jobs> {
  
  @override
  Widget build(BuildContext context) {
    final labelWelcomeText = Text(
      'Welcome : ' + widget.strUsername.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    final labelJobs = Text(
      widget.arrJobList["m_strJobName"].toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        SizedBox(height: 60.0),
        labelWelcomeText,
        labelJobs,
        SizedBox(height: 60.0),
      ],
    )));
  }
}
