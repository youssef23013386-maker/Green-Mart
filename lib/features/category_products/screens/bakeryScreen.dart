import 'package:flutter/material.dart';

class BakeryScreen extends StatelessWidget {
  const BakeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const _BakeryBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Bakery'),
    );
  }
}

class _BakeryBody extends StatelessWidget {
  const _BakeryBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bakery Products will be displayed here.',
      ),
    );
  }
}