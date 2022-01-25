import 'package:dio/dio.dart';
import 'package:weather_app/product/constant/weather_project_constat.dart';

import '../model/weather_model.dart';

abstract class IWeatherService {
  final Dio networkManager = WeatherConstants.instance.dio;

  IWeatherService();

  Future<WeatherModel> fetchWeatherData({String cityName});
}
