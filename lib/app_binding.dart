import 'package:flutter_mvvm_get/services/services.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(NetworkManager());
    Get.lazyPut<FilmsProvider>(() => FilmsProvider());
    Get.lazyPut<FilmsRepository>(
        () => FilmsRepository(apiProvider: Get.find()));
    Get.put(AuthProvider());
    Get.put(AuthRepository(authProvider: Get.find()));
  }
}
