import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/home/data/productModel.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.productModel, this.onTap});
  final ProductModel productModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.07),
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(16),

          border: Border.all(color: AppColors.accentColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: productModel.taqId,
                  child: Image.network(productModel.image),
                ),
              ),
            ),
            SizedBox(height: 16),

            Text(
              productModel.name,
              style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              productModel.quantityForPrice,
              style: TextStyles.small.copyWith(color: AppColors.greyColor),
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${productModel.price.toStringAsFixed(2)}',
                  style: TextStyles.body.copyWith(fontWeight: FontWeight.w600),
                ),
                FloatingActionButton.small(
                  heroTag: null,
                  elevation: 0,
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
