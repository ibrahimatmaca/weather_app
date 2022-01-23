import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../viewmodel/weather_cubit_state.dart';

extension WeatherInitalWidget on WeatherInitial {
  Widget buildWidget() {
    return const Center(child: Text("WeatherInitalWidget"));
  }
}

extension WeatherErrorStateWidget on WeatherErrorState {
  Widget buildWidget() {
    return const Center(child: Text("Internet Connection WeatherErrorState"));
  }
}

extension WeatherCompleteStateWidget on WeatherCompleteState {
  Widget buildWidget() {
    return ListView.builder(
      itemCount: listWeatther.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 30, right: 30, child: refreshIconButton(context)),
                columnWeatherInfo(listWeatther, index),
              ],
            ),
          ),
        );
      },
    );
  }
}

IconButton refreshIconButton(BuildContext context) {
  return IconButton(
    onPressed: () => BlocProvider.of<WeatherCubit>(context).fetchWeatherItem(),
    icon: const Icon(
      Icons.refresh_sharp,
      size: 32,
    ),
  );
}

Column columnWeatherInfo(listWeatther, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      //${listWeatther[index].current!.tempC}
      Text(
        "27°C",
        style: GoogleFonts.montserrat(fontSize: 90),
      ),
      Text(
        "${listWeatther[index].location!.name}",
        style: GoogleFonts.montserrat(fontSize: 30),
      ),
      Text(
        listWeatther[index]
            .location!
            .localtime!
            .split(" ")
            .sublist(1)
            .join(' '),
        style: GoogleFonts.montserrat(fontSize: 30),
      )
    ],
  );
}
