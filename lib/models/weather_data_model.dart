import 'package:flutterapp/models/parent.dart';
import 'package:flutterapp/models/sources.dart';
import 'package:json_annotation/json_annotation.dart';

import 'consolidated_weather.dart';

part 'weather_data_model.g.dart';

@JsonSerializable(nullable: false)
class WeatherDataModel {
  List<ConsolidatedWeather> consolidated_weather;
  String time;
  String sun_rise;
  String sunSet;
  String timezone_name;
  Parent parent;
  List<Sources> sources;
  String title;
  String location_type;
  int woeid;
  String latt_long;
  String timezone;

  WeatherDataModel(
      this.consolidated_weather,
      this.time,
      this.sun_rise,
      this.sunSet,
      this.timezone_name,
      this.parent,
      this.sources,
      this.title,
      this.location_type,
      this.woeid,
      this.latt_long,
      this.timezone);

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataModelToJson(this);
}
