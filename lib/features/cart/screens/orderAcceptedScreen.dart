import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/customSvgPicture.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/main/mainAppScreen.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            CustomSvgPicture(path: AppImages.orderAcceptedSvg, height: 250),
            const Spacer(),
            _title(),
            const SizedBox(height: 16),
            _description(),
            const SizedBox(height: 40),
            _homeButton(context),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Your Order has been accepted',
      textAlign: TextAlign.center,
      style: TextStyles.subtitle.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _description() {
    return Text(
      "Your items has been placed and is on\nit's way to being processed",
      textAlign: TextAlign.center,
      style: TextStyles.body.copyWith(color: AppColors.greyColor),
    );
  }

  Widget _homeButton(BuildContext context) {
    return PrimaryButton(
      height: 65,
      width: double.infinity,
      backgroundColor: AppColors.primaryColor,
      textStyle: TextStyles.subtitle.copyWith(color: Colors.white),
      title: 'Go To Home',
      onPressed: () {
        pushAndRemoveUntilAll(context, const MainAppScreen());
      },
    );
  }
}