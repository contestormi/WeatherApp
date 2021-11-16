import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/presentation/pages/result_page.dart';
import 'package:weather_bloc/presentation/widgets/search_form_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherIsLoaded) {
            return ResultPage(
              weather: state.weather,
            );
          } else if (state is WeatherError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  ElevatedButton(
                    onPressed: () {
                      context.read<WeatherBloc>().add(ResetWeather());
                    },
                    child: const Text('Попробовать еще раз'),
                  ),
                ],
              )),
            );
          } else {
            return Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchFormWidget(
                      textEditingController: _textEditingController,
                      formKey: _formKey,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<WeatherBloc>()
                              .add(GetWeather(_textEditingController.text));
                        }
                      },
                      child: const Text('Поиск'),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
