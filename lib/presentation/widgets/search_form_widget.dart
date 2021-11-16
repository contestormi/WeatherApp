import 'package:flutter/material.dart';
import 'package:weather_bloc/presentation/theme.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget(
      {Key? key, required this.textEditingController, required this.formKey})
      : super(key: key);

  final TextEditingController textEditingController;
  final GlobalKey formKey;

  @override
  _SearchFormWidgetState createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: "Введите название города",
          fillColor: Colors.white,
          focusedBorder: MyTheme.defaultBorder,
          enabledBorder: MyTheme.defaultBorder,
          errorBorder: MyTheme.errorBorder,
          focusedErrorBorder: MyTheme.errorBorder,
        ),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.contains(RegExp(r'^[0-9]*$'))) {
            return 'Пожалуйста введите название города';
          }
          return null;
        },
      ),
    );
  }
}
