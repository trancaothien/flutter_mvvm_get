import 'package:flutter_mvvm_get/models/models.dart';
import 'package:flutter_mvvm_get/services/services.dart';
import 'package:flutter_mvvm_get/shared/shared.dart';
import 'package:get/get.dart';
import '../api.dart';

class FilmsRepository {
  FilmsRepository({required this.apiProvider});

  final FilmsProvider apiProvider;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  Future<NetworkState<FilmModel>> getStarWarInfo({required int id}) async {
    if (networkManager.connectionType == Network.NO_CONNECTED) {
      return NetworkState.withDisconnect();
    }
    final res =
        await apiProvider.getStarWarInfo(ApiConstants.GET_STAR_WAR_INFO, id);
    if (res.statusCode != 200) {
      return NetworkState.withError(res);
    }
    return NetworkState(
      statusCode: res.statusCode,
      data: FilmModel.fromJson(res.body),
    );
  }
}
