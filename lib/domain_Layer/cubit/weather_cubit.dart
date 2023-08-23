import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/domain_Layer/cubit/states.dart';
import 'package:weather_bloc/data_layer/models/weather_model.dart';
import 'package:weather_bloc/data_layer/services/weather_service.dart';

class WeatherCubit extends Cubit<StatesWeather> {
  WeatherCubit(this.weatherService) : super(IntialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  // to take object in many places
  static WeatherCubit getWeatherCubit(context) => BlocProvider.of(context);
  void getWeather({required String cityName}) async {
    emit(Loding());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(Success());
    } catch (e) {
      emit(Failur());
    }
  }
}
