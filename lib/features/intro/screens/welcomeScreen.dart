
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/auth/screens/LoginScreen.dart';
import 'package:greenmart/core/widgets/MainButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.carrotSvg,
                  colorFilter: ColorFilter.mode(
                    AppColors.backgroundColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome\nto our store',
                  style: TextStyles.headline.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Ger your groceries in as fast as one hour',
                  style: TextStyles.body.copyWith(color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizedBox(height: 30),

                PrimaryButton(
                  onPressed: () {
                    pushReplacement(context, LoginScreen());
                  },
                  title: 'Get Started',
                  height: 65,
                  width: double.infinity,
                  backgroundColor: AppColors.primaryColor,
                  textStyle: TextStyles.subtitle.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
