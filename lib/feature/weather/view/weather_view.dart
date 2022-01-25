import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/exception/widget_not_found.dart';
import '../service/weather_service.dart';
import '../viewmodel/weather_cubit_state.dart';
import 'state/state_widget.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(
        WeatherService(),
      ),
      lazy: true,
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: returnBody(context, state),
          );
        },
      ),
    );
  }

  Widget returnBody(BuildContext context, WeatherState state) {
    if (state is WeatherInitial) {
      return state.buildWidget();
    } else if (state is WeatherLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is WeatherCompleteState) {
      return state.buildWidget();
    } else if (state is WeatherErrorState) {
      return state.buildWidget();
    }
    throw WidgetNotFoundException<WeatherView, WeatherState>(state);

    /* switch (state.runtimeType) {
      case WeatherInitial:
        return state.buildWidget();
      case WeatherLoadingState:
        return const Center(child: CircularProgressIndicator());
      case WeatherCompleteState:
        return state.buildWidget();
      default:
        throw throw WidgetNotFoundException<WeatherView, WeatherState>(state);
    } */
  }
}
