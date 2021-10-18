import 'package:get/get.dart';
import 'services/api/api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(FilmsProvider());
    Get.put(FilmsRepository(apiProvider: Get.find()));
    Get.put(AuthProvider());
    Get.put(AuthRepository(authProvider: Get.find()));
  }
}
