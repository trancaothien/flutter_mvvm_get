import 'dart:developer' as developer;

import 'api.dart';

class RouteRepository {
  RouteRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future getRoutes() async {
    final res = await apiProvider.getRouters(ApiConstants.GET_ROUTERS);
    developer.log('${res.body}');
    return res;
  }

  // Future<RegisterResponse?> register(RegisterRequest data) async {
  //   final res = await apiProvider.register('/api/register', data);
  //   if (res.statusCode == 200) {
  //     return RegisterResponse.fromJson(res.body);
  //   }
  // }

  // Future<UsersResponse?> getUsers() async {
  //   final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
  //   if (res.statusCode == 200) {
  //     return UsersResponse.fromJson(res.body);
  //   }
  // }
}
