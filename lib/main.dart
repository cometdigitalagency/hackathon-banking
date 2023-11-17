// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_shy_banking/constants/constant_color.dart';
import 'package:super_shy_banking/screens/bussiness_screen.dart';
import 'package:super_shy_banking/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BussinessScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SUPERSHYBANKING'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset("assets/icons/scanning.svg"),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _selectedIndex == 0
                  ? ConstantColors.primary
                  : ConstantColors.grey,
            ),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/history.svg",
              color: _selectedIndex == 1
                  ? ConstantColors.primary
                  : ConstantColors.grey,
            ),
            label: 'ປະຫວັດທຸລະກຳ',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
