import 'package:flutter/material.dart';
import 'package:login_flutter/screens/login_screen.dart';
import 'package:login_flutter/screens/forget_password_screen.dart';
import 'package:login_flutter/screens/change_password_screen.dart';
import 'package:login_flutter/screens/jobs_screen.dart';
import 'package:login_flutter/screens/sign_up_screen.dart';
import 'package:login_flutter/screens/main_screen.dart';

final routes = {
  '/screens/login_screen': (BuildContext context) => new LoginScreen(),
  '/screens/forget_password_screen': (BuildContext context) => new ForgetPassword(),
  '/screens/change_password_screen': (BuildContext context) => new ChangePassword(),
  '/screens/jobs_screen': (BuildContext context) => new Jobs(),
  '/screens/sign_up_screen': (BuildContext context) => new SignUp(),
  '/screens/main_screen': (BuildContext context) => new MainScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
