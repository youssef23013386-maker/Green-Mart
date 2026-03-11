import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/customPasswordFormField.dart';
import 'package:greenmart/core/widgets/customTextFormField.dart';
import 'package:greenmart/core/widgets/MainButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 10),
            child: Form(
              key: _signupFormKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  const SizedBox(height: 40),
                  _header(),
                  const SizedBox(height: 40),
                  _nameField(),
                  const SizedBox(height: 18),
                  _emailField(),
                  const SizedBox(height: 18),
                  _passwordField(),
                  const SizedBox(height: 32),
                  _signupButton(),
                  const SizedBox(height: 16),
                  _loginSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(AppImages.carrotSvg),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign Up', style: TextStyles.title),
        const SizedBox(height: 16),
        Text(
          'Enter your credentials to continue',
          style: TextStyles.caption.copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Widget _nameField() {
    return _labelWithField(
      label: 'Name',
      hint: 'youssef elmay',
      validator: (v) {
        if (v!.isEmpty) return 'Please enter your name';
        return null;
      },
    );
  }

  Widget _emailField() {
    return _labelWithField(
      label: 'Email',
      hint: 'example@gmail.com',
      validator: (v) {
        if (v!.isEmpty) return 'Please enter your email';
        if (!v.contains('@')) return 'Please enter a valid email';
        return null;
      },
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label('Password'),
        const SizedBox(height: 8),
        CustomPasswordFormField(
          hintText: '*************',
          validator: (v) {
            if (v!.isEmpty) return 'Please enter your password';
            if (v.length < 6) return 'Password must be at least characters';
            return null;
          },
        )
      ],
    );
  }

  Widget _signupButton() {
    return PrimaryButton(
      title: 'Sign Up',
      onPressed: () {
        if (_signupFormKey.currentState!.validate()) {}
      },
    );
  }

  Widget _loginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyles.caption.copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => popFrom(context),
          child: Text(
            "Login",
            style: TextStyles.caption.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _labelWithField({
    required String label,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: hint,
          validator: validator,
        )
      ],
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: TextStyles.caption.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.greyColor,
      ),
    );
  }
}