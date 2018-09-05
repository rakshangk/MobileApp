import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String strUsername;
  MainScreen({Key key,this.strUsername}):super(key:key);
  @override
  MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    final labelWelcomeText = Text(
      'Welcome : '+widget.strUsername,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final btnFetchList = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Fetch List', style: TextStyle(color: Colors.white)),
          onPressed: () {
            //  Navigator.of(context).pushNamed('/screens/sign_up_screen');
          },
        ),
      ),
    );

    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        labelWelcomeText,
        btnFetchList,
      ],
    )));
  }
}
