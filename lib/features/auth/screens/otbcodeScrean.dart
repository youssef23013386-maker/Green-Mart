import 'package:flutter/material.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/main/mainAppScreen.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  final GlobalKey<FormState> _otpForm = GlobalKey();

  final String correctPin = '12345';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 90),
            child: Form(
              key: _otpForm,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 32),
                  _otpInput(),
                  const SizedBox(height: 16),
                  _actions(),
                  const SizedBox(height: 16),
                  _confirmButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () => popFrom(context),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter verification code', style: TextStyles.title),
        const SizedBox(height: 16),
        Text(
          'We have sent SMS to: 01XXXXXXXXXX',
          style: TextStyles.caption.copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Widget _otpInput() {
    return Center(
      child: Pinput(
        length: 5,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (value != correctPin) {
            return 'Pin is incorrect';
          }
          return null;
        },
        onCompleted: (v) {
          pushAndRemoveUntilAll(context, MainAppScreen());
        },
      ),
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {},
          child: Text(
            'Resend OTP',
            style: TextStyles.caption.copyWith(
              color: AppColors.tangoNormalColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => popFrom(context),
          child: Text(
            'Change Phone Number',
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.blackNormalColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _confirmButton() {
    return PrimaryButton(
      height: 70,
      title: 'Confirm',
      onPressed: () {
        if (_otpForm.currentState!.validate()) {
          pushAndRemoveUntilAll(context, MainAppScreen());
        }
      },
    );
  }
}