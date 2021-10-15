import 'package:get/get.dart';
import 'main_menu_view_model.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainMenuViewModel>(MainMenuViewModel(filmsRepository: Get.find()));
  }
}
