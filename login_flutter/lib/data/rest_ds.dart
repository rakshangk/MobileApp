import 'dart:async';
import 'package:login_flutter/utils/network_util.dart';
import 'package:login_flutter/models/user.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL =
      "http://authframework-eapp.mgtmzrenwf.ap-southeast-1.elasticbeanstalk.com";
  static final LOGIN_URL = BASE_URL + "/signIn";

  Future<User> login(String username, String password, BuildContext context) {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print('****************_API_KEY********************* : ' + basicAuth);
    return _netUtil.post(LOGIN_URL,
        headers: {'authorization': basicAuth},
        body: {"username": username, "password": password}).then((dynamic res) {
      print(res.toString());
      if (res['m_bIsSuccess']) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Login Dialog"),
              content: new Text(res["strResponseMessage"]),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed('/screens/home_screen');
                  },
                ),
              ],
            );
          },
        );
        print('*********************************');
        print('Success : ' + res["strResponseMessage"]);
      }
    });
  }
}
