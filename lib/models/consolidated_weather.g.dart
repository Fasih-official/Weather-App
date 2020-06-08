// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    id: json['id'] as int,
    weather_state_name: json['weather_state_name'] as String,
    weather_state_abbr: json['weather_state_abbr'] as String,
    wind_direction_compass: json['wind_direction_compass'] as String,
    created: json['created'] as String,
    applicable_date: json['applicable_date'] as String,
    min_temp: (json['min_temp'] as num).toDouble(),
    max_temp: (json['max_temp'] as num).toDouble(),
    the_temp: (json['the_temp'] as num).toDouble(),
    wind_speed: (json['wind_speed'] as num).toDouble(),
    wind_direction: (json['wind_direction'] as num).toDouble(),
    air_pressure: (json['air_pressure'] as num).toDouble(),
    humidity: json['humidity'] as int,
    visibility: (json['visibility'] as num).toDouble(),
    predictability: json['predictability'] as int,
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weather_state_name,
      'weather_state_abbr': instance.weather_state_abbr,
      'wind_direction_compass': instance.wind_direction_compass,
      'created': instance.created,
      'applicable_date': instance.applicable_date,
      'min_temp': instance.min_temp,
      'max_temp': instance.max_temp,
      'the_temp': instance.the_temp,
      'wind_speed': instance.wind_speed,
      'wind_direction': instance.wind_direction,
      'air_pressure': instance.air_pressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
