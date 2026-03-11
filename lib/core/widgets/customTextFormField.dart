import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.onTapOfTextFormField,
    this.onChanged,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? enabled;
  final void Function()? onTapOfTextFormField;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.text,

      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle:
            hintStyle ??
            TextStyles.caption.copyWith(color: AppColors.blackNormalColor),
        hintText: hintText,
      ),
      onTap: onTapOfTextFormField,
    );
  }
}
