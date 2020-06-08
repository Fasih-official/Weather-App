// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLocationModel _$WeatherLocationModelFromJson(Map<String, dynamic> json) {
  return WeatherLocationModel(
    json['lattLong'] as String,
    json['locationType'] as String,
    json['title'] as String,
    json['woeid'] as int,
  );
}

Map<String, dynamic> _$WeatherLocationModelToJson(
        WeatherLocationModel instance) =>
    <String, dynamic>{
      'lattLong': instance.lattLong,
      'locationType': instance.locationType,
      'title': instance.title,
      'woeid': instance.woeid,
    };
