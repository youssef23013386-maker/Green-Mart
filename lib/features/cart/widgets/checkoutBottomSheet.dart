import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/cart/screens/orderAcceptedScreen.dart';
import 'package:greenmart/features/cart/widgets/checkoutRow.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final double totalPrice;

  const CheckoutBottomSheet({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Checkout',
                style: TextStyles.subtitle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 24,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Divider(
            color: AppColors.gainsboroColor,
            thickness: 1,
          ),

          /// Delivery
          CheckoutRow(
            title: 'Delivery',
            endWidget: Text(
              'Select Method',
              style: TextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),

          const Divider(),

          /// Payment
          CheckoutRow(
            title: 'Payment',
            endWidget: Image.asset(
              AppImages.paymentIcon,
              width: 24,
            ),
            onTap: () {},
          ),

          const Divider(),

          /// Promo Code
          CheckoutRow(
            title: 'Promo Code',
            endWidget: Text(
              'Pick discount',
              style: TextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),

          const Divider(),

          /// Total Cost
          CheckoutRow(
            title: 'Total Cost',
            endWidget: Text(
              '\$${totalPrice.toStringAsFixed(2)}',
              style: TextStyles.body.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {},
          ),

          Divider(
            color: AppColors.gainsboroColor,
            thickness: 1,
          ),

          const SizedBox(height: 16),

          /// Terms
          RichText(
            text: TextSpan(
              style: TextStyles.small.copyWith(color: Colors.grey),
              children: const [
                TextSpan(
                  text: 'By placing an order you agree to our\n',
                ),
                TextSpan(
                  text: 'Terms',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' And '),
                TextSpan(
                  text: 'Conditions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// Place Order Button
          PrimaryButton(
            onPressed: () {
              Navigator.pop(context);
              pushTo(context, const OrderAcceptedScreen());
            },
            title: 'Place Order',
            height: 65,
            width: double.infinity,
            backgroundColor: AppColors.primaryColor,
            textStyle: TextStyles.subtitle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}