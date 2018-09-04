import 'package:flutter/material.dart';
import 'package:login_flutter/models/user.dart';
import 'package:login_flutter/data/rest_ds.dart';

class ForgetPassword extends StatefulWidget {
  static String tag = 'forget-password-page';
  @override
  ForgetPasswordState createState() => new ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();

  var varUsername = new TextEditingController();
  var varOTP = new TextEditingController();

  User user;
  bool bAutoValidate = false;
  RestDatasource restDatasource = new RestDatasource();

  @override
  Widget build(BuildContext context) {
    final labelForgetPassword = Text(
      'Forget Password',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final txtUsername = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: varUsername,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        labelText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please enter username...";
      },
    );

    final txtOTP = TextFormField(
      autofocus: false,
      controller: varOTP,
      decoration: InputDecoration(
        hintText: 'Enter OTP',
        labelText: 'OTP',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please enter Password...";
      },
    );

    final btnGenerateOTP = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Generate OTP', style: TextStyle(color: Colors.white)),
          onPressed: () {
            if (frmKey.currentState.validate()) {}
          },
        ),
      ),
    );

    final btnSubmit = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Submit', style: TextStyle(color: Colors.white)),
          onPressed: () {},
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          autovalidate: bAutoValidate,
          key: frmKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 48.0),
              labelForgetPassword,
              SizedBox(height: 30.0),
              txtUsername,
              SizedBox(height: 8.0),
              btnGenerateOTP,
              SizedBox(height: 8.0),
              txtOTP,
              SizedBox(height: 8.0),
              btnSubmit,
            ],
          ),
        ),
      ),
    );
  }
}
