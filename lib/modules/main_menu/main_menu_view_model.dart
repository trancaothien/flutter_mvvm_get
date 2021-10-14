import 'dart:async';

import '../base_module/base_module.dart';

class MainMenuViewModel extends BaseViewModel {
  @override
  void onInit() {
    setLoading(true);
    super.onInit();
  }

  @override
  void onReady() {
    Timer(const Duration(seconds: 5), () => {setLoading(false)});
    super.onReady();
  }
}
