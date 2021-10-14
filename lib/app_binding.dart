import 'package:get/get.dart';
import 'services/api/api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(AuthRepository(apiProvider: Get.find()), permanent: true);
    Get.put(RouteRepository(apiProvider: Get.find()), permanent: true);
  }
}
