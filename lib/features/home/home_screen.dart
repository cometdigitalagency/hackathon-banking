import 'package:flutter/material.dart';
import 'package:super_shy_banking/common/common_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(),
      body: const Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
