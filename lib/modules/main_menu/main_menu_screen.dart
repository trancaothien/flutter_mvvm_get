import 'package:flutter/material.dart';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get.dart';

import 'main_menu_view_model.dart';

class MainMenuScreen extends GetView<MainMenuViewModel> {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetLoadingFullScreen(
      child: const Scaffold(
        body: Center(
          child: Text('main menu'),
        ),
      ),
      loading: controller.loadingSubject,
    );
  }
}
