import 'package:flutter/material.dart';
import 'package:login_flutter/utils/form_validation.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => new SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  FormValadation oFormValadation = new FormValadation();
  var varName = new TextEditingController();
  var varMobile = new TextEditingController();
  var varEmail = new TextEditingController();
  var varPasssword = new TextEditingController();
  var varConfirmPasssword = new TextEditingController();
  bool bAutoValidate = false;

  @override
  Widget build(BuildContext context) {
    final labelSignUp = Text(
      'Sign Up',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final txtFirsttName = TextFormField(
      keyboardType: TextInputType.text,
      controller: varName,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'FirstName',
        labelText: 'FirstName',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please Enter First Name...";
      },
    );

    final txtLastName = TextFormField(
      keyboardType: TextInputType.text,
      controller: varName,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'LastName',
        labelText: 'LastName',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please Enter Last Name...";
      },
    );

    final txtMobile = TextFormField(
      keyboardType: TextInputType.number,
      controller: varMobile,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Mobile Number',
        labelText: 'Mobile Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please Enter Mobile Number...";
        if (value.length != 10) return "Please Enter valid Mobile Number...";
      },
    );
    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: varEmail,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email ID',
        labelText: 'Email ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        String strValidationMessage;
        if (value.isNotEmpty)
          strValidationMessage = oFormValadation.emailNotMatched(value);
        else
          strValidationMessage = "please enter User Mail-Id/Username ";
        return strValidationMessage;
      },
    );
    final txtPassword = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: varPasssword,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        if (value.isEmpty) return "Please Enter Password...";
      },
    );

    final txtConfirmPassword = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: varConfirmPasssword,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      validator: (value) {
        String strValidationMessage;
        if (value.isNotEmpty)
          strValidationMessage =
              oFormValadation.passwordNotMatched(varPasssword, value);
        else
          strValidationMessage = "please Re-type password ";
        return strValidationMessage;
      },
    );
    final btnSignUp = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          color: Colors.blue,
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
          onPressed: () {
            // Navigator.of(context).pushNamed(HomePage.tag);
            if (frmKey.currentState.validate()) {}
          },
        ),
      ),
    );
    final labelHaveAccount = FlatButton(
      child: Text(
        'Already have an account?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('/screens/login_screen');
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
              labelSignUp,
              SizedBox(height: 30.0),
              txtEmail,
              SizedBox(height: 8.0),
              txtFirsttName,
              SizedBox(height: 8.0),
              txtLastName,
              SizedBox(height: 8.0),
              txtMobile,
              SizedBox(height: 8.0),
              txtPassword,
              SizedBox(height: 8.0),
              txtConfirmPassword,
              SizedBox(height: 8.0),
              btnSignUp,
              labelHaveAccount,
            ],
          ),
        ),
      ),
    );
  }
}
