import 'package:flutter_mvvm_get/routes/routes.dart';
import 'package:flutter_mvvm_get/services/services.dart';

import '../base_module/base_module.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({required this.routeRepository});

  final RouteRepository routeRepository;

  @override
  void onInit() async {
    await routeRepository.getRoutes();
    EasyLoading.showSuccess("success");
    Get.toNamed(AppRoutes.MAIN_MENU);

    super.onInit();
  }
}
