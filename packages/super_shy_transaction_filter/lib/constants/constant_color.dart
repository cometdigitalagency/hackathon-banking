part of super_shy_transaction_filter;

class ConstantColors {
  static const Color grey = Color(0xff333B44);
  static const Color scaffoldBackgroundColor = Color(0xffF4F4F4);
  static const Color white = Color(0xffFFFFFF);
  static const Color sucess = Color(0xff00B578);
  static const Color primary = Color(0xff1E3A8A);
  static const Color primary2 = Color(0xff3E5AA9);
  static const errorColor = Color(0xFFFF5555);

  static List<Color> mainGradient = [
    const Color(0xFF3E5AA9),
    const Color(0xFF1E3A8A),
  ];

  static const MaterialColor mainColor = MaterialColor(
    0xff1E3A8A, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
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
