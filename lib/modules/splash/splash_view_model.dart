import 'dart:async';
import 'package:flutter_mvvm_get/routes/routes.dart';
import '../base_module/base_module.dart';
import 'package:get/get.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onInit() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.MAIN_MENU);
    });
    super.onInit();
  }
}
