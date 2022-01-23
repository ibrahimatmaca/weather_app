import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'feature/weather/view/weather_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Weather App',
      home: const WeatherView(),
    );
  }
}
