import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/textStyle.dart';

class CheckoutRow extends StatelessWidget {
  final String title;
  final Widget endWidget;
  final VoidCallback onTap;

  const CheckoutRow({
    super.key,
    required this.title,
    required this.endWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.body.copyWith(color: Colors.grey),
            ),
            Row(
              children: [
                endWidget,
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            )
          ],
        ),
      ),
    );
  }
}