import 'package:flutter/material.dart';

class ConstantColors {
  static const Color grey = Color(0xff333B44);
  static const Color primary = Color(0xff1677FF);

  static const MaterialColor mainColor = MaterialColor(
    0xff1677FF, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffCDE8DF),
      100: Color(0xffCDE8DF),
      200: Color(0xffCDE8DF),
      300: Color(0xffCDE8DF),
      400: Color(0xffCDE8DF),
      500: Color(0xffCDE8DF),
      600: Color(0xffCDE8DF),
      700: Color(0xffCDE8DF),
      800: Color(0xffCDE8DF),
      900: Color(0xffCDE8DF), //10%
    },
  );
}
