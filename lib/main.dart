import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/themes.dart';
import 'package:greenmart/features/intro/screens/splashScreen.dart';
import 'package:greenmart/features/main/mainAppScreen.dart';
// import 'package:greenmart/features/main/main_app_screen.dart';

void main() {
  runApp(const GreenMart());
}

class GreenMart extends StatelessWidget {
  const GreenMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.light,
      builder: (context, child) {
        return SafeArea(top: false, bottom: true, child: child!);
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
