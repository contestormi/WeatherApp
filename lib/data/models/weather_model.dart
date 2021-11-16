import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc/data/models/coord_model.dart';
import 'package:weather_bloc/data/models/main_model.dart';
import 'package:weather_bloc/data/models/wind_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class Weather {
  final String name;
  final int cod;
  final int id;
  final Main main;
  final int timezone;
  final int dt;
  final int visibility;
  final String base;
  final Coord coord;
  final Wind wind;

  Weather({
    required this.wind,
    required this.name,
    required this.id,
    required this.main,
    required this.cod,
    required this.timezone,
    required this.dt,
    required this.visibility,
    required this.base,
    required this.coord,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
