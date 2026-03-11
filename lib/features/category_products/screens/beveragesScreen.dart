import 'package:flutter/material.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beverages'),
      ),
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Beverages Products will be displayed here.',
      ),
    );
  }
}