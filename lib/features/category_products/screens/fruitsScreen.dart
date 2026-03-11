import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/customSvgPicture.dart';
import 'package:greenmart/features/home/data/dummyData.dart';
import 'package:greenmart/features/home/widgets/itemCard.dart';
import 'package:greenmart/features/product_detail/screens/productDetailScreen.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: CustomSvgPicture(path: AppImages.filterSvg),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          onPressed: () => popFrom(context),
          icon: Icon(Icons.arrow_back_ios_new, size: 20),
        ),
        title: Text(
          'Frash Fruits & Vegetable',
          style: TextStyles.caption.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        itemCount: allProductsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // mainAxisSpacing: 12,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          final product = allProductsList[index];

          return ItemCard(
            productModel: product,
            onTap: () =>
                pushTo(context, ProductDetailScreen(productModel: product)),
          );
        },
      ),
    );
  }
}
