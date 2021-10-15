import 'dart:developer';

import 'package:flutter_mvvm_get/services/services.dart';
import 'package:get/get.dart';

class NetworkState<T> {
  int? statusCode;
  String? message;
  T? data;

  NetworkState({
    this.statusCode,
    this.message,
    this.data,
  });

  NetworkState.withError(Response? response) {
    String message;
    int statusCode;
    log("=========== ERROR ===========");
    if (response != null) {
      log("=========== statusCode ===========");
      log("${response.statusCode}");
      statusCode = response.statusCode!;
      log("=========== data ===========");
      log("${response.body}");
      message = response.body["message"] ?? response.body;
    } else {
      statusCode = ApiConstants.ERROR_SERVER;
      log("=========== message ===========");
      message = "Không thể kết nối đến máy chủ!";
    }
    this.message = message;
    this.statusCode = statusCode;
    data = null;
  }

  NetworkState.withDisconnect() {
    log("=========== DISCONNECT ===========");
    message = "Mất kết nối internet, vui lòng kiểm tra wifi/3g và thử lại!";
    statusCode = ApiConstants.ERROR_DISCONNECT;
    data = null;
  }

  bool get isSuccess => statusCode == ApiConstants.SUCCESS;

  bool get isError => statusCode != ApiConstants.SUCCESS;
}
