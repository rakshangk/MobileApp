import 'package:flutter/material.dart';
import 'package:login_flutter/models/user.dart';
import 'package:login_flutter/data/rest_ds.dart';
import 'package:login_flutter/utils/form_validation.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  FormValadation oFormValadation=new FormValadation();
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  var strUsername = new TextEditingController();
  var strPassword = new TextEditingController();
  var strOTP = new TextEditingController();
  User user;
  bool bAutoValidate = false;
  RestDatasource restDatasource = new RestDatasource();

  @override
  Widget build(BuildContext context) {
    final labelForgetPassword = Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: strUsername,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        labelText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        String strValidationMessage;
        if (value.isNotEmpty)
          strValidationMessage =
              oFormValadation.emailNotMatched(value);
        else
          strValidationMessage = "please enter User Mail-Id/Username ";
        return strValidationMessage;
      },
    );

    final password = TextFormField(
      autofocus: false,
      controller: strPassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please enter Password...";
      },
    );
    

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
          onPressed: () {
            // Navigator.of(context).pushNamed(HomePage.tag);
            if (frmKey.currentState.validate()) {
              restDatasource.login(strUsername.text, strPassword.text, context);
            }
          },
        ),
      ),
    );

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('SignUp', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pushNamed('/screens/sign_up_screen');
          },
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/screens/forget_password_screen');
      },
    );

    final changePasswordLabel = FlatButton(
      child: Text(
        'change password',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/screens/change_password_screen');
      },
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
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              signUpButton,
              forgotLabel,

              //changePasswordLabel,
            ],
          ),
        ),
      ),
    );
  }
}
