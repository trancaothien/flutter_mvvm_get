import 'package:flutter/material.dart';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get.dart';
import 'main_menu_view_model.dart';

class MainMenuScreen extends GetView<MainMenuViewModel> {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetLoadingFullScreen(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text('Star War: ${controller.filmModel.value.title ?? ''}'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: _body(),
      ),
      loading: controller.loadingSubject,
    );
  }

  Widget _body() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Opening crawl: ${controller.filmModel.value.openingCrawl ?? ''}'),
              const SizedBox(height: 20),
              Text('Episode id: ${controller.filmModel.value.episodeId ?? ''}'),
              const SizedBox(height: 20),
              Text('Director: ${controller.filmModel.value.director ?? ''}'),
              const SizedBox(height: 20),
              Text('Producer: ${controller.filmModel.value.producer ?? ''}'),
              const SizedBox(height: 20),
              Text(
                  'Release date: ${controller.filmModel.value.releaseDate ?? ''}'),
            ],
          );
        }),
      ),
    );
  }
}
