// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      name: json['name'] as String,
      id: json['id'] as int,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      cod: json['cod'] as int,
      timezone: json['timezone'] as int,
      dt: json['dt'] as int,
      visibility: json['visibility'] as int,
      base: json['base'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'name': instance.name,
      'cod': instance.cod,
      'id': instance.id,
      'main': instance.main,
      'timezone': instance.timezone,
      'dt': instance.dt,
      'visibility': instance.visibility,
      'base': instance.base,
      'coord': instance.coord,
      'wind': instance.wind,
    };
