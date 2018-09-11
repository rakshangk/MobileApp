import 'package:flutter/material.dart';
import 'package:login_flutter/data/rest_ds.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MainScreen extends StatefulWidget {
  final String strUsername;
  final String strPassword;
  final dynamic arrTenantList;
  MainScreen({Key key, this.strUsername, this.strPassword, this.arrTenantList})
      : super(key: key);
  @override
  MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  RestDatasource oRestDatasource = new RestDatasource();
  

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

    final labelTenantList = Text(
      
      'List : ' + widget.arrTenantList[0].toString(),
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
            oRestDatasource.getTenantList(
                widget.strUsername, widget.strPassword, context);
          },
        ),
      ),
    );

    return Scaffold(
        body: Center(
            child: ListView(
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      children: <Widget>[
        SizedBox(height: 60.0),
        labelWelcomeText,
        btnFetchList,
        SizedBox(height: 60.0),
        labelTenantList,
      ],
    )));
  }
}
