// ignore_for_file: library_prefixes, avoid_print, prefer_const_constructors, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, empty_catches, prefer_if_null_operators

import 'dart:convert';
import 'package:fav_random_demo/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as Http;

class ApiClient extends GetxController {
  Future<Response> postData(
    String uri,
    dynamic body,
  ) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\n');
        print('====> API Body: ${jsonEncode(body)}');
      }
      Http.Response _response = await Http.post(
        Uri.parse(AppConstant.BASEURL + uri),
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 35));
      print(_response.contentLength);
      return handleResponse(_response, uri);
    } catch (e) {
      print("errorrrrrrrrrrrrrrrrrr " + e.toString());
      return Response(statusCode: 1, statusText: "noInternetMessage");
    }
  }

  Future<Response> putData(
    String uri,
    dynamic body,
  ) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\n');
        print('====> API Body: ${jsonEncode(body)}');
      }
      Http.Response _response = await Http.put(
        Uri.parse(AppConstant.BASEURL + uri),
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 35));
      print(_response.contentLength);
      return handleResponse(_response, uri);
    } catch (e) {
      print("errorrrrrrrrrrrrrrrrrr " + e.toString());
      return Response(statusCode: 1, statusText: "noInternetMessage");
    }
  }

  Future<Response> deleteData(
    String uri,
    dynamic body,
  ) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\n');
        print('====> API Body: ${jsonEncode(body)}');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(AppConstant.BASEURL + uri),
        body: jsonEncode(body),
      ).timeout(Duration(seconds: 35));
      print(_response.contentLength);
      return handleResponse(_response, uri);
    } catch (e) {
      print("errorrrrrrrrrrrrrrrrrr " + e.toString());
      return Response(statusCode: 1, statusText: "noInternetMessage");
    }
  }

  Future<Response> getData(String uri) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri');
      }
      Http.Response _response = await Http.get(
        Uri.parse(AppConstant.BASEURL + uri),
      ).timeout(Duration(seconds: 35));

      return handleResponse(_response, uri);
    } catch (e) {
      print('------------${e.toString()}');
      return Response(statusCode: 1, statusText: "noInternetMessage");
    }
  }

  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().contains('error')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: "noInternetMessage");
    }
    if (Foundation.kDebugMode) {
      print(
          '====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    }
    return _response;
  }
}
