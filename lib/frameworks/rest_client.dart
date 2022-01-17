import 'dart:io';

import 'package:dio/dio.dart';

class RestClient {
  static final Dio dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    headers: {"Content-Type": "application/json"},
  ));

  static bool isSuccess(int? statusCode) {
    if (statusCode != null && statusCode == HttpStatus.ok) return true;
    return false;
  }
}
