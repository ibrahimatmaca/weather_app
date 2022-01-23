enum NetworkQuery { CITY_NAME }

extension NetworkQueryExtension on NetworkQuery {
  MapEntry<String, dynamic> cityQuery(String cityName) =>
      MapEntry('q', cityName);
  MapEntry<String, dynamic> aqiParameter() => const MapEntry('aqi', 'no');
}
