import 'package:flutter/material.dart';

class CookingOilScreen extends StatelessWidget {
  const CookingOilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: _body(),
    );
  }

  PreferredSizeWidget _header() {
    return AppBar(
      title: const Text('Cooking Oil'),
    );
  }

  Widget _body() {
    return const Center(
      child: Text(
        'Cooking Oil Products will be displayed here.',
      ),
    );
  }
}