import 'package:dio/dio.dart';

import '../model/weather_model.dart';

abstract class IWeatherService {
  final Dio networkManager;

  IWeatherService({required this.networkManager});

  Future<WeatherModel> fetchWeatherData({String cityName});
}
