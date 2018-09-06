import 'dart:async';
import 'package:login_flutter/utils/network_util.dart';
import 'package:login_flutter/models/user.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_flutter/screens/main_screen.dart';
import 'package:login_flutter/models/tenant_list.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL =
      "http://authframework-eapp.mgtmzrenwf.ap-southeast-1.elasticbeanstalk.com";
  static final LOGIN_URL = BASE_URL + "/signIn";
  static final TENANTLIST_URL = BASE_URL + "/listJobs";

  Future<User> login(String username, String password, BuildContext context) {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print('****************_API_KEY********************* : ' + basicAuth);
    return _netUtil.post(LOGIN_URL,
        headers: {'authorization': basicAuth},
        body: {"username": username, "password": password}).then((dynamic res) {
      print(res.toString());
      if (res['m_bIsSuccess']) {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new MainScreen(strUsername: username, strPassword: password),
        );
        Navigator.of(context).push(route);
        print('*********************************');
        print('Success : ' + res["strResponseMessage"]);
      }
    });
  }

  Future<TenantList> getTenantList(
      String username, String password, BuildContext context) {
      String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print('****************_API_KEY********************* : ' + basicAuth);
    return _netUtil.get(TENANTLIST_URL,
        headers: {'authorization': basicAuth}).then((dynamic res) {
      print(res.toString());
      Map<String,dynamic> data = json.decode(res);
      List arrjobList = data['arrJobList'];
      if (arrjobList.length > 0) {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new MainScreen(arrTenantList: arrjobList),
        );
        Navigator.of(context).push(route);
        print('*********************************');
        //print('Success : ' + res["arrJobList"]);
      }
    });
  }
}
