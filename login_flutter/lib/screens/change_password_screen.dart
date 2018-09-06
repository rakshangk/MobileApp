import 'package:flutter/material.dart';
import 'package:login_flutter/models/user.dart';
import 'package:login_flutter/data/rest_ds.dart';
import 'package:login_flutter/utils/form_validation.dart';

class ChangePassword extends StatefulWidget {
  static String tag = 'ConfirmPassword-page';

  @override
  ChangePasswordScreeenState createState() => new ChangePasswordScreeenState();
}

class ChangePasswordScreeenState extends State<ChangePassword> {
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();

  FormValadation oFormValidation = new FormValadation();

  var strCurrentPassword = new TextEditingController();
  var strNewPassword = new TextEditingController();
  var strVerifyPassword = new TextEditingController();

  User user;
  bool bAutoValidate = false;

  RestDatasource restDatasource = new RestDatasource();

  @override
  Widget build(BuildContext context) {
    final Confirm_Label = Hero(
      tag: 'hero',
      child: Text(
        'Confirm Password',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 20.0,
        ),
      ),
    );

    final txtCurrentPassword = TextFormField(
      //keyboardType: TextInputType.emailAddress,
      controller: strCurrentPassword,
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Current Password',
        labelText: 'CurrentPassword',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please enter CurrentPassword...";
      },
    );

    final txtNewPassword = TextFormField(
      autofocus: false,
      controller: strNewPassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'New Password',
        labelText: 'New Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please enter New Password...";
      },
    );

    final txtVerifyPassword = TextFormField(
      autofocus: false,
      controller: strVerifyPassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Verify Password',
        labelText: 'Verify Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isNotEmpty) {
          return oFormValidation.passwordNotMatched(strNewPassword, value);
        } else {
          return "please verify password ";
        }
      },
    );

    final btnSubmitButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          onPressed: () {
            // Navigator.of(context).pushNamed(HomePage.tag);
            if (frmKey.currentState.validate()) {
              //on submit click
            }
          },
          color: Colors.lightBlueAccent,
          child: Text('Confirm', style: TextStyle(color: Colors.white)),
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
            Confirm_Label,
            SizedBox(height: 48.0),
            txtCurrentPassword,
            SizedBox(height: 10.0),
            txtNewPassword,
            SizedBox(height: 10.0),
            txtVerifyPassword,
            SizedBox(height: 24.0),
            btnSubmitButton,
          ],
        ),
      )),
    );
  }
}
