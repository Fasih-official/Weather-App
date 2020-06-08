import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

@JsonSerializable(nullable: false)
class ConsolidatedWeather {
  int id;
  String weather_state_name;
  String weather_state_abbr;
  String wind_direction_compass;
  String created;
  String applicable_date;
  double min_temp;
  double max_temp;
  double the_temp;
  double wind_speed;
  double wind_direction;
  double air_pressure;
  int humidity;
  double visibility;
  int predictability;

  ConsolidatedWeather(
      {this.id,
      this.weather_state_name,
      this.weather_state_abbr,
      this.wind_direction_compass,
      this.created,
      this.applicable_date,
      this.min_temp,
      this.max_temp,
      this.the_temp,
      this.wind_speed,
      this.wind_direction,
      this.air_pressure,
      this.humidity,
      this.visibility,
      this.predictability});

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}
