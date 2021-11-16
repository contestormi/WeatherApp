import 'package:flutter/material.dart';
import 'package:weather_bloc/data/models/weather_model.dart';
import 'package:weather_bloc/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/presentation/theme.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Город: ${weather.name}',
              style: MyTheme.defaultTextStyle,
            ),
            Text(
              'Широта: ${weather.coord.lat.toString()}',
              style: MyTheme.defaultTextStyle,
            ),
            Text(
              'Долгота: ${weather.coord.lon.toString()}',
              style: MyTheme.defaultTextStyle,
            ),
            Text(
              'Давление: ${weather.main.pressure.toString()}',
              style: MyTheme.defaultTextStyle,
            ),
            Text(
              'Максимальная температура в Кельвинах: ${weather.main.tempMax.toString()}',
              style: MyTheme.defaultTextStyle,
            ),
            Text(
              'Минимальная температура в Кельвинах: ${weather.main.tempMin.toString()}',
              style: MyTheme.defaultTextStyle,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<WeatherBloc>().add(ResetWeather());
              },
              child: const Text('Вернуться к поиску'),
            ),
          ],
        ),
      ),
    );
  }
}
