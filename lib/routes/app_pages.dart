import 'package:flutter_mvvm_get/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN_MENU,
      page: () => const MainMenuScreen(),
      binding: MainMenuBinding(),
    )
  ];
}
