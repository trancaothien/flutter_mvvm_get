import 'dart:async';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mvvm_get/models/models.dart';
import 'package:flutter_mvvm_get/services/services.dart';
import 'package:get/get.dart';
import '../base_module/base_module.dart';

class MainMenuViewModel extends BaseViewModel {
  MainMenuViewModel({required this.filmsRepository});

  final FilmsRepository filmsRepository;
  final filmModel = FilmModel().obs;

  @override
  void onInit() async {
    setLoading(true);
    NetworkState<FilmModel> res = await filmsRepository.getStarWarInfo(id: 1);
    if (res.isSuccess) {
      filmModel.value = res.data!;
      update();
    } else {
      EasyLoading.showToast(res.message!);
    }
    Timer(const Duration(seconds: 2), () => {setLoading(false)});
    super.onInit();
  }
}
