import 'package:get/get.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getRouters(String path) {
    return get(path);
  }
}
