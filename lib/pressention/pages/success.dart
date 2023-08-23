
// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:weather_bloc/domain_Layer/cubit/weather_cubit.dart';
import 'package:weather_bloc/data_layer/models/weather_model.dart';

class SuccssesBody extends StatelessWidget {
   SuccssesBody({
    super.key,
    required this.weatherData,

  });
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[300]!,
          weatherData!.getThemeColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
           Text(
           ' ${WeatherCubit.getWeatherCubit(context).cityName}'
,            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Text(
              'updated at : ${weatherData!.date.hour}:${weatherData!.date.minute}',
              style: const TextStyle(
                fontSize: 22,
              ),
                     ),
           ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
               Text(
                '${weatherData!.temp.toInt()}',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Column(
                children: [
                  Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                  Text('minTemp :${weatherData!.minTemp.toInt()} '),
                ],
              ),
            ],
          ),
          const Spacer(),
           Text(
            '${weatherData!.weatherStateName}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
