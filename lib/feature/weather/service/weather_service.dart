import 'package:dio/dio.dart';
import 'package:weather_app/product/util/network_query.dart';

import '../../../product/util/network_route.dart';
import '../model/weather_model.dart';
import 'IWeatherService.dart';

class WeatherService extends IWeatherService {
  WeatherService() : super();

  @override
  Future<WeatherModel> fetchWeatherData({String? cityName}) async {
    try {
      final response = await networkManager.get(
        NetworkRoute.WEATHER.rawValue,
        queryParameters: Map.fromEntries([
          NetworkQuery.CITY_NAME.cityQuery(cityName!),
          NetworkQuery.CITY_NAME.aqiParameter(),
        ]),
      );

      if (response.statusCode == 200) {
        // print("Responsee:" + response.requestOptions.uri.toString());

        final fromJson = WeatherModel.fromJson(response.data);

        return fromJson;
      }
    } on DioError catch (e) {
      print("Full Path: " + e.requestOptions.uri.toString());
      return WeatherModel();
    }
    return WeatherModel();
  }
}

/* NetworkRoute.WEATHER.rawValue,
          queryParameters: Map.fromEntries(
            [NetworkQuery.CITY_NAME.cityQuery(cityName!)],
          ),
          options: Options(
            headers: {
              'appid': '650446a23671633cec5d9cc5d1b029ad',
              'lang': 'tr'
            },
          ) */