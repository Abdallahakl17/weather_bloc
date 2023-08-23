// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_bloc/domain_Layer/cubit/weather_cubit.dart';
import 'package:weather_bloc/data_layer/services/weather_service.dart';
import 'pressention/pages/home_page.dart';

void main() {
  runApp(BlocProvider(create: (context) => WeatherCubit(WeatherService()),
    child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: WeatherCubit.getWeatherCubit(context).weatherModel == null
            ? Colors.blue
            : WeatherCubit.getWeatherCubit(context).weatherModel!.getThemeColor()
                ,
      ),
      home:  HomePageState(),
    );
  }
}
