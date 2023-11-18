// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_shy_banking/constants/constant_color.dart';
import 'package:super_shy_banking/navigator_action.dart';

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
      theme: ThemeData(
        primarySwatch: ConstantColors.mainColor,
        fontFamily: "NotoSansLao",
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ConstantColors.primary,
        ),
      ),
      home: const NavigatorAction(),
    );
  }
}
