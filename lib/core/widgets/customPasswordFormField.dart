import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.validator,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.suffixIcon ??
            IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.remove_red_eye),
            ),
        hintStyle:
            widget.hintStyle ??
            TextStyles.caption.copyWith(color: AppColors.blackNormalColor),

        hintText: widget.hintText,
      ),
    );
  }
}
