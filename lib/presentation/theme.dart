import 'package:flutter/material.dart';

abstract class MyTheme {
  static final defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: const BorderSide(
      color: Colors.blue,
    ),
  );

  static final errorBorder = defaultBorder.copyWith(
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );

  static const defaultTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    letterSpacing: 0,
  );
}
