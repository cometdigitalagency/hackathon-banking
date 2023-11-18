// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants/constant_color.dart';
import 'features/history/history_screen.dart';
import 'features/home/home_screen.dart';

class NavigatorAction extends HookWidget {
  const NavigatorAction({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState<int>(0);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: const [
          HomeScreen(),
          HistoryScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent, // Set a transparent background
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ConstantColors.mainGradient,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: SvgPicture.asset(
            "assets/icons/scanning.svg",
          ), // Add your icon or child widget here
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: currentIndex.value == 0
                  ? ConstantColors.primary
                  : ConstantColors.grey,
            ),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/history.svg",
              color: currentIndex.value == 1
                  ? ConstantColors.primary
                  : ConstantColors.grey,
            ),
            label: 'ປະຫວັດທຸລະກຳ',
          ),
        ],
        currentIndex: currentIndex.value,
        onTap: (index) => currentIndex.value = index,
      ),
    );
  }
}
