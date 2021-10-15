import 'vi_vn_translations.dart';
import 'en_us_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'vi_VN': viVN,
  };
}
