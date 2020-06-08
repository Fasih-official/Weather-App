import 'package:flutterapp/models/weather_data_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherFetchingState extends WeatherState {
  WeatherFetchingState();
}

class WeatherFetchedState extends WeatherState {
  WeatherDataModel weatherDataModel;

  WeatherFetchedState(this.weatherDataModel);
}

class WeatherErrorState extends WeatherState {}
