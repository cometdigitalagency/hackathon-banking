// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_banking/constants/constant_color.dart';
import 'package:super_shy_banking/navigator_action.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Shy Banking',
      debugShowCheckedModeBanner: false,
      locale: const Locale('lo'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('lo', 'LA'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: ConstantColors.mainColor,
        fontFamily: "NotoSansLao",
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ConstantColors.primary,
        ),
        scaffoldBackgroundColor: ConstantColors.scaffoldBackgroundColor,
      ),
      home: const NavigatorAction(),
    );
  }
}
