import 'package:flutter/material.dart';
import 'package:login_flutter/screens/login_screen.dart';
import 'package:login_flutter/screens/forget_password_screen.dart';

final routes = {
  '/screens/login_screen': (BuildContext context) => new LoginScreen(),
  '/screens/forget_password_screen': (BuildContext context) => new ForgetPassword(),
  '/': (BuildContext context) => new LoginScreen(),
};
