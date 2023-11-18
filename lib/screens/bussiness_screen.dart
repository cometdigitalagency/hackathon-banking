import 'package:flutter/material.dart';

class BussinessScreen extends StatelessWidget {
  const BussinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'ປະຫວັດທຸລະກຳ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text("BussinessScreen"),
      ),
    );
  }
}
