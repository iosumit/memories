import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String POST = "POST";
  static const String GET = "GET";
  static const String DELETE = "DELETE";
  static const String PUT = "PUT";

  static const String Success = "Success";
  static const String Error = "Error";

  static final Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };

  static Future<dynamic> callApi({
    String? method,
    required String url,
    Map<String, String>? header,
    Map? body,
  }) async {
    var client = http.Client();

    http.Response response;
    print(url);

    try {
      if (method == POST) {
        response = await client.post(Uri.parse(url),
            body: jsonEncode(body), headers: httpHeaders);
      } else if (method == PUT) {
        response = await client.put(Uri.parse(url),
            body: jsonEncode(body), headers: httpHeaders);
      } else if (method == DELETE) {
        response = await client.delete(Uri.parse(url), headers: httpHeaders);
      } else {
        response = await client.get(Uri.parse(url), headers: httpHeaders);
      }
      if (kDebugMode) {
        print("-------------------------");
        print(response.request);
        print(jsonEncode(body));
        print(response.body);
        print("-------------------------");
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
