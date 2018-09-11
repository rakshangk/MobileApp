import 'dart:async';
import 'package:login_flutter/utils/network_util.dart';
import 'package:login_flutter/models/user.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_flutter/screens/main_screen.dart';
import 'package:login_flutter/models/tenant_list.dart';
import 'package:login_flutter/Constants/URLConstants.dart';

class RestDatasource {
  NetworkUtil oNetworkUtil = new NetworkUtil();
  URLConstants oURLConstants = new URLConstants();

  Future<User> login(String username, String password, BuildContext context) {
    String strBasicAuth = oNetworkUtil.getBasicAuth(username, password);
    return oNetworkUtil.post(context, oURLConstants.strLoginURL,
        headers: {'authorization': strBasicAuth},
        body: {"username": username, "password": password}).then((dynamic res) {
      if (res['m_bIsSuccess']) {
        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
              new MainScreen(strUsername: username, strPassword: password),
        );
        Navigator.of(context).push(route);
      }
    });
  }

  Future<TenantList> getTenantList(
      String username, String password, BuildContext context) {
    String strBasicAuth = oNetworkUtil.getBasicAuth(username, password);
    return oNetworkUtil.get(context, oURLConstants.strTenantURL,
        headers: {'authorization': strBasicAuth}).then((dynamic res) {
      print(res.toString());

      Map<String, dynamic> data = json.decode(res);
      List arrjobList = data['arrJobList'];
      Map<String, dynamic> arrTenantList;
      for (int nIndex = 0; nIndex < arrjobList.length; nIndex++) {
        arrTenantList = arrjobList[nIndex];
        for (int nArray = 0; nArray < arrjobList.length; nArray++) {
          print('ID=' + arrTenantList['m_nId'].toString());
          print('ID=' + arrTenantList['m_strJobName'].toString());
        }
      }
      if (arrjobList.length > 0) {
        Navigator.of(context).pop();
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new MainScreen(
              arrTenantList: arrTenantList,
              strUsername: username,
              strPassword: password),
        );
        Navigator.of(context).push(route);
      }
    });
  }
}
