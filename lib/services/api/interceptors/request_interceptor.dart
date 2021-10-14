import 'dart:async';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  final token = AppPref.accessToken;
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';
  return request;
}
