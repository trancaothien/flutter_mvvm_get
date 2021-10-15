import 'dart:async';
import 'dart:developer';
import 'package:flutter_mvvm_get/models/models.dart';
import 'package:flutter_mvvm_get/routes/routes.dart';
import '../base_module/base_module.dart';
import 'package:get/get.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onInit() async {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.MAIN_MENU);
    });
    super.onInit();
  }
}
