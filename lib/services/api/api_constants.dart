// ignore_for_file: constant_identifier_names

class ApiConstants {
  // statusCode
  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  // base url
  static const String BASE_URL = 'https://swapi.dev';

  // routes
  static const String GET_STAR_WAR_INFO = '/api/films';
}
