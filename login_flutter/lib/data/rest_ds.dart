import 'dart:async';
import 'dart:convert';
import 'package:login_flutter/models/tenant_list.dart';
import 'package:login_flutter/utils/network_util.dart';
import 'package:login_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/screens/main_screen.dart';
import 'package:login_flutter/screens/jobs_screen.dart';
import 'package:login_flutter/Constants/URLConstants.dart';
import 'package:login_flutter/utils/shared_preferences.dart';

class RestDatasource {
  NetworkUtil oNetworkUtil = new NetworkUtil();
  URLConstants oURLConstants = new URLConstants();
  SharedPreference oSharedPreference = new SharedPreference();

  Future<User> login(String username, String password, BuildContext context) {
    String strBasicAuth = oNetworkUtil.getBasicAuth(username, password);
    return oNetworkUtil.post(context, oURLConstants.strLoginURL,
        headers: {'authorization': strBasicAuth},
        body: {"username": username, "password": password}).then((dynamic res) {
      if (res['m_bIsSuccess']) {
        print(res.toString());
        Map<String, dynamic> data = res;
        List<dynamic> arrTenantList = data['arrTenantList'];
        print('Tenant List=' + arrTenantList.toString());
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new MainScreen(
                strUsername: username,
                strPassword: password,
                arrTenantList: arrTenantList,
              ),
        );
        Navigator.of(context).push(route);
      }
    });
  }

  Future<TenantList> getJobList(
      String username, String password, BuildContext context) {
    NetworkUtil oNetworkUtil = new NetworkUtil();
    URLConstants oURLConstants = new URLConstants();
    String strBasicAuth = oNetworkUtil.getBasicAuth(username, password);
    return oNetworkUtil.get(context, oURLConstants.strTenantURL,
        headers: {'authorization': strBasicAuth}).then(
      (dynamic res) {
        print("Data Source= " + res.toString());
        Map<String, dynamic> data = json.decode(res.toString());
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new Jobs(
                strUsername: username,
                strPassword: password,
                arrJobList: data,
              ),
        );
        Navigator.of(context).push(route);
      },
    );
  }

  Future<User> logout(String username, String password, BuildContext context) {
    String strBasicAuth = oNetworkUtil.getBasicAuth(username, password);
    return oNetworkUtil.getLogout(context, oURLConstants.strLogoutURL,
        headers: {'authorization': strBasicAuth}).then((dynamic res) {
      if (res.statusCode == 204) Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/screens/login_screen');
    });
  }
}
