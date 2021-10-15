import 'package:get/get.dart';
import '../base_provider.dart';

class FilmsProvider extends BaseProvider {
  Future<Response> getRouters(String path) {
    return get(path);
  }

  Future<Response> getStarWarInfo(String path, int filmId) {
    return get('$path/$filmId');
  }
}
