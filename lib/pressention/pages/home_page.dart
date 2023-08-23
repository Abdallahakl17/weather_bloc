// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/domain_Layer/cubit/states.dart';
import 'package:weather_bloc/domain_Layer/cubit/weather_cubit.dart';
// ignore: unused_import
import 'package:weather_bloc/data_layer/models/weather_model.dart';
import 'package:weather_bloc/pressention/pages/failur.dart';

import 'search_page.dart';
import 'success.dart';

class HomePageState extends StatelessWidget {
  WeatherModel? weatherData;
  HomePageState({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, StatesWeather>(
        builder: (context, state) {
          if (state is Loding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Success) {
            weatherData = WeatherCubit.getWeatherCubit(context).weatherModel;
            return SuccssesBody(
              weatherData: weatherData,
            );
          } else if (state is Failur) {
            return const Center(
                child: Text(
              'something wrong please try agin ! ',
              style: TextStyle(fontSize: 22),
            ));
          } else {
            return const InitailBody();
          }
        },
      ),
    );
  }
}
