import 'package:get/get.dart';
import 'services/api/api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(FilmsProvider(), permanent: true);
    Get.put(FilmsRepository(apiProvider: Get.find()), permanent: true);
    Get.put(AuthProvider(), permanent: true);
    Get.put(AuthRepository(authProvider: Get.find()), permanent: true);
  }
}
