import 'package:flutter/material.dart';
import 'package:login_flutter/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:login_flutter/models/user.dart';
import 'package:login_flutter/data/rest_ds.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();

  var strUsername = new TextEditingController();
  var strPassword = new TextEditingController();

  User user;
  bool bAutoValidate = false;

  RestDatasource restDatasource = new RestDatasource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // padding: EdgeInsets.only(left: 24.0, right: 24.0),
      // shrinkWrap: true,
      body: new Form(
          autovalidate: bAutoValidate,
          key: frmKey,
          child: ListView(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 150.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                controller: strUsername,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please enter username...";
                },
              ),
              SizedBox(height: 10.0),
              new TextFormField(
                keyboardType: TextInputType.text,
                controller: strPassword,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please enter password...";
                },
              ),
              SizedBox(height: 20.0),
              new Padding(
                padding: EdgeInsets.all(0.0),
                child: Material(
                  borderRadius: BorderRadius.circular(5.0),
                  shadowColor: Colors.red,
                  elevation: 5.0,
                  child: MaterialButton(
                    height: 55.0,
                    color: Colors.lightBlueAccent,
                    child:
                        Text('Log In', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(HomePage.tag);
                      if (frmKey.currentState.validate()) {
                        restDatasource.login(
                            strUsername.text, strPassword.text, context);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              FlatButton(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
