import 'package:json_annotation/json_annotation.dart';

part 'weather_location_model.g.dart';

@JsonSerializable(nullable: false)
class WeatherLocationModel {
  String lattLong;
  String locationType;
  String title;
  int woeid;

  WeatherLocationModel(
      this.lattLong, this.locationType, this.title, this.woeid);

  factory WeatherLocationModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationModelToJson(this);
}
