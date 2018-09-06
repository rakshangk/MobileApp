import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> post(String url, {headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception(
            "Error while fetching data, statusCode:$statusCode");
      }
      return _decoder.convert(res);
    });
  }

Future<dynamic> get(String url, {headers}) {
    return http
        .get(url, headers: headers, )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception(
            "Error while fetching data, statusCode:$statusCode");
      }
      return res ;
    });
  }


}
