import 'package:flutter/material.dart';

class MeatScreen extends StatelessWidget {
  const MeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(),
      body: const _MeatBody(),
    );
  }

  PreferredSizeWidget _buildBar() {
    return AppBar(
      title: const Text('Meat'),
    );
  }
}

class _MeatBody extends StatelessWidget {
  const _MeatBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Meat Products will be displayed here.',
      ),
    );
  }
}