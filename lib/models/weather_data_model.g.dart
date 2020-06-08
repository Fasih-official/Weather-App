// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) {
  return WeatherDataModel(
    (json['consolidated_weather'] as List)
        .map((e) => ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['time'] as String,
    json['sun_rise'] as String,
    json['sunSet'] as String,
    json['timezone_name'] as String,
    Parent.fromJson(json['parent'] as Map<String, dynamic>),
    (json['sources'] as List)
        .map((e) => Sources.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['title'] as String,
    json['location_type'] as String,
    json['woeid'] as int,
    json['latt_long'] as String,
    json['timezone'] as String,
  );
}

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.consolidated_weather,
      'time': instance.time,
      'sun_rise': instance.sun_rise,
      'sunSet': instance.sunSet,
      'timezone_name': instance.timezone_name,
      'parent': instance.parent,
      'sources': instance.sources,
      'title': instance.title,
      'location_type': instance.location_type,
      'woeid': instance.woeid,
      'latt_long': instance.latt_long,
      'timezone': instance.timezone,
    };
