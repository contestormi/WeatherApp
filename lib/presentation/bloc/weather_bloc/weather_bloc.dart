import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_bloc/data/datasources/weather_remote.dart';
import 'package:weather_bloc/data/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRemoteDataImpl _weatherRemoteDataImpl;

  WeatherBloc(this._weatherRemoteDataImpl) : super(WeatherInitial()) {
    on<GetWeather>(_onGetWeatherEvent);
    on<ResetWeather>(_onResetWeatherEvent);
  }

  void _onGetWeatherEvent(
    GetWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherIsLoading());
    try {
      Weather weather = await _weatherRemoteDataImpl.getWeather(event.city);
      emit(WeatherIsLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  void _onResetWeatherEvent(
    WeatherEvent event,
    Emitter<WeatherState> emit,
  ) {
    emit(WeatherInitial());
  }
}
