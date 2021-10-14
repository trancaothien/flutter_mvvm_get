import 'package:rxdart/rxdart.dart';
import 'package:get_storage/get_storage.dart';

class AppPref {
  AppPref._();

  static final GetStorage _box = GetStorage('AppPref');

  static final BehaviorSubject _userBehavior = BehaviorSubject<dynamic>();

  static initListener() async {
    await GetStorage.init("AppPref");
    // _box.listenKey('user', (user) {
    //   _userBehavior.add(user);
    // });
  }

  static set accessToken(String? token) => _box.write('accessToken', token);

  static String? get accessToken => _box.read('accessToken');

  // static set user(Apps? _user) {
  //   _box.write('user', _user);
  // }

  // static Apps? get user {
  //   final _ = _box.read('user');
  //   if (_ == null) return null;
  //   return _ is Apps ? _ : Apps.fromJson(_box.read('user'));
  // }

  static Stream get watchUser => _userBehavior.stream;
}
