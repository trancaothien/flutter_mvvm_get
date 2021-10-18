import 'dart:async';
import 'dart:developer';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> authInterceptor(request) async {
  log('request: $request');
  // final token = AppPref.accessToken;
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}
