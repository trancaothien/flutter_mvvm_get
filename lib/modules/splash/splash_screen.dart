import 'package:flutter/material.dart';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get.dart';
import 'splash_view_model.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetLoadingFullScreen(
        child: const Scaffold(
          body: Center(
            child: Text('splash'),
          ),
        ),
        loading: controller.loadingSubject);
  }
}
