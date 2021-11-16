part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final Weather weather;

  WeatherIsLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);
}
