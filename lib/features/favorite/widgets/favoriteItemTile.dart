import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/home/data/productModel.dart';

class FavoriteItemTile extends StatelessWidget {
  const FavoriteItemTile({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _buildImage(),

          const SizedBox(width: 12),

          Expanded(child: _buildInfo()),

          _buildTrailing(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      productModel.image,
      width: 60,
      height: 60,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.image_not_supported),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.name,
          style: TextStyles.body.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          productModel.quantityForPrice,
          style: TextStyles.small.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$${productModel.price}',
          style: TextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),

        const SizedBox(width: 8),

        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.black,
        ),
      ],
    );
  }
}