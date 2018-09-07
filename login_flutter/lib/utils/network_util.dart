import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_flutter/Widgets/dynamic_Widgets.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  DynamicWidgets oDynamicWidgets = new DynamicWidgets();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> post(BuildContext context, String url,
      {headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      String res;
      if (response.statusCode == 401 ||
          response.statusCode < 200 ||
          response.statusCode > 400) {
        showStatusCode(context, response);
      } else {
        res = response.body;
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> get(BuildContext context,String url, {headers}) {
    return http
        .get(
      url,
      headers: headers,
    )
        .then((http.Response response) {
      final String res = response.body;
      showStatusCode(context, response);
      return res;
    });
  }

  String getBasicAuth(String strUsername, String strPassword) {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$strUsername:$strPassword'));
    print('****************BASIC AUTH KEY*********************');
    print(basicAuth);
    print('***************************************************');
    return basicAuth;
  }

  void showStatusCode(BuildContext context, http.Response strResponse) {
    String strErrorMessage;
    final int nStatusCode = strResponse.statusCode;
    if (nStatusCode == 401)
      strErrorMessage = "Invalid username and password";
    else if (nStatusCode < 200 || nStatusCode > 400 || json == null)
      strErrorMessage = "Error Fetching Data";
    if (nStatusCode != 200 && nStatusCode!=202)
      oDynamicWidgets.showAlertDialog(
          context, 'Login Failed!', strErrorMessage);
  }
}
