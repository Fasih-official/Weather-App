abstract class WeatherEvent {}

class WeatherFetchingEvent extends WeatherEvent {
  String cityName;

  WeatherFetchingEvent(this.cityName);
}
