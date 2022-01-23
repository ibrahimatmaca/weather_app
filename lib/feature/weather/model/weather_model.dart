import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherModelToJson(this);
  }
}

@JsonSerializable()
class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  double? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable()
class Current {
  double? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  double? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? humidity;
  double? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  factory Current.fromJson(Map<String, dynamic> json) {
    return _$CurrentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CurrentToJson(this);
  }
}

@JsonSerializable()
class Condition {
  String? text;
  String? icon;
  double? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return _$ConditionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConditionToJson(this);
  }
}
