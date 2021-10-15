import 'package:flutter_mvvm_get/models/models.dart';
import '../api.dart';

class FilmsRepository {
  FilmsRepository({required this.apiProvider});

  final FilmsProvider apiProvider;

  Future<NetworkState<FilmModel>> getStarWarInfo({required int id}) async {
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
