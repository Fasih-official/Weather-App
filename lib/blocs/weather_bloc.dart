import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/blocs/weather_event.dart';
import 'package:flutterapp/blocs/weather_state.dart';
import 'package:flutterapp/models/weather_data_model.dart';
import 'package:flutterapp/weather_repository.dart';
import 'package:flutterapp/web_services.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository;

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherFetchingEvent) {
      //needs to make an API call here
      try {
        repository = WeatherRepository(WebServices.initial());
        yield WeatherFetchingState();
        WeatherDataModel weatherDataModel =
            await repository.getWeather(event.cityName);
        yield WeatherFetchedState(weatherDataModel);
      } on Exception {
        yield WeatherErrorState();
      }
    }
  }
}
