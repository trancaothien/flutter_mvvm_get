import 'package:get/get.dart';
import 'api.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.BASE_URL;
    httpClient.timeout = const Duration(seconds: 10); // default timeout = 8 s,
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
