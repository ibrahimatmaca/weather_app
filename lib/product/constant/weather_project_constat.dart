import 'package:dio/dio.dart';
import '../util/network_route.dart';

class WeatherConstants {
  static WeatherConstants? _instance;
  static WeatherConstants get instance {
    _instance ??= WeatherConstants._init();
    return _instance!;
  }

  WeatherConstants._init();

  BaseOptions baseOptions = BaseOptions(
    baseUrl: NetworkRoute.BASE_URL.rawValue,
    headers: {'key': NetworkRoute.API_KEY.rawValue},
  );
}
