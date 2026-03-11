import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/customPasswordFormField.dart';
import 'package:greenmart/core/widgets/customTextFormField.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/auth/screens/SignUpScreen.dart';
import 'package:greenmart/features/auth/screens/verifyNumberScrean.dart';
import 'package:greenmart/features/main/mainAppScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _loginFormKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logo(),
                  const SizedBox(height: 40),
                  _titleSection(),
                  const SizedBox(height: 40),
                  _emailField(),
                  const SizedBox(height: 18),
                  _passwordField(),
                  const SizedBox(height: 12),
                  _forgotPassword(),
                  const SizedBox(height: 28),
                  _loginButton(),
                  const SizedBox(height: 16),
                  _signupSection(),
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

  Widget _titleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Login', style: TextStyles.title),
        const SizedBox(height: 16),
        Text(
          'Enter your emails and password',
          style: TextStyles.caption.copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Widget _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hintText: 'example@gmail.com',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
        ),
        const SizedBox(height: 8),
        CustomPasswordFormField(
          hintText: '*************',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            pushTo(context, const VerifyMobileScreen());
          },
          child: Text(
            'Forgot Password?',
            style: TextStyles.caption.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return PrimaryButton(
      title: 'Log In',
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {}
        pushAndRemoveUntilAll(context, const MainAppScreen());
      },
    );
  }

  Widget _signupSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyles.caption.copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            pushTo(context, const SignUpScreen());
          },
          child: Text(
            "Signup",
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}