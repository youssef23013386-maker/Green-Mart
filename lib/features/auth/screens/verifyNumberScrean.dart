import 'package:flutter/material.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/customTextFormField.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/auth/screens/otbcodeScrean.dart';


class VerifyMobileScreen extends StatefulWidget {
  const VerifyMobileScreen({super.key});

  @override
  State<VerifyMobileScreen> createState() => _VerifyMobileScreenState();
}

class _VerifyMobileScreenState extends State<VerifyMobileScreen> {

  final GlobalKey<FormState> _phoneForm = GlobalKey();

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
              key: _phoneForm,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 45),
                  _phoneField(),
                  const SizedBox(height: 45),
                  _nextButton(),
                  const SizedBox(height: 14),
                  _resend(),
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
        Text('Enter your mobile number', style: TextStyles.title),
        const SizedBox(height: 16),
        Text(
          'We need to verify you. We will send you a one time verification code.',
          style: TextStyles.caption.copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Widget _phoneField() {
    return CustomTextFormField(
      hintText: '01xxxxxxxxxx',
      keyboardType: TextInputType.phone,
      validator: (v) {
        if (v!.isEmpty) return 'Please enter your mobile number';
        return null;
      },
    );
  }

  Widget _nextButton() {
    return PrimaryButton(
      title: 'Next',
      onPressed: () {
        if (_phoneForm.currentState!.validate()) {
          pushTo(context, const VerifyCodeScreen());
        }
      },
    );
  }

  Widget _resend() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Resend confirmation code (1:23)',
          style: TextStyles.body.copyWith(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}