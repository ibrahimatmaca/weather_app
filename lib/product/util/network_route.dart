import 'package:flutter_config/flutter_config.dart';

import '../exception/network_route_exception.dart';

enum NetworkRoute { BASE_URL, WEATHER, API_KEY }

extension NetworkRouteExtension on NetworkRoute {
  // Normalde api ile ilgili dosyalar buradan değil .env dosyasından çekilir
  String get rawValue {
    switch (this) {
      case NetworkRoute.BASE_URL:
        return FlutterConfig.get('BASE_URL');
      case NetworkRoute.WEATHER:
        return FlutterConfig.get('WEATHER');
      case NetworkRoute.API_KEY:
        return FlutterConfig.get('API_KEY');
      default:
        throw NetworkRouteException();
    }
  }
}
//38da6101c64f4fde88692041222301