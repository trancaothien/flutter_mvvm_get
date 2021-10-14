import 'package:flutter_mvvm_get/services/services.dart';
import 'package:get/get.dart';

import 'splash_view_model.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(
        () => SplashViewModel(routeRepository: Get.find<RouteRepository>()));
  }
}
