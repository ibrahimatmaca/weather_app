import 'package:bloc/bloc.dart';

import '../model/weather_model.dart';
import '../service/IWeatherService.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial()) {
    fetchWeatherItem();
  }

  List<String> cityNames = ['London', 'Samsun'];

  Future<void> fetchWeatherItem() async {
    emit(WeatherLoadingState(true));
    final weatherItems = await _returnListWeather();
    if (weatherItems.isEmpty) {
      emit(WeatherErrorState());
    } else {
      emit(WeatherCompleteState(weatherItems));
    }
  }

  Future<List<WeatherModel>> _returnListWeather() async {
    List<WeatherModel> getList = [];
    for (var item in cityNames) {
      final weatherItem = await weatherService.fetchWeatherData(cityName: item);
      if (weatherItem.location!.name != null) getList.add(weatherItem);
    }
    return getList;
  }
}

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {
  final bool isLoading;

  WeatherLoadingState(this.isLoading);
}

class WeatherCompleteState extends WeatherState {
  final List<WeatherModel> listWeatther;
  //final WeatherModel weather;

  WeatherCompleteState(this.listWeatther);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState();
}
