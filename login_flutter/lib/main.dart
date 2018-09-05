import 'package:flutter/material.dart';
import 'package:login_flutter/routes.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TechMust',
      routes: routes,
    );
  }
}
