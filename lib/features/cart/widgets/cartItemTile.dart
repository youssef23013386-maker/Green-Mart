import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/cart/data/cartItemMdel.dart';
import 'package:greenmart/features/product_detail/widgets/productQuantity.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel cartItem;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            cartItem.product.image,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cartItem.product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  cartItem.product.quantityForPrice,
                  style: TextStyles.small.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 10),

                ProductQuantityAndPrice(
                  productModel: cartItem.product,
                  count: cartItem.quantity,
                  onDecrement: onDecrement,
                  onIncrement: onIncrement,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}