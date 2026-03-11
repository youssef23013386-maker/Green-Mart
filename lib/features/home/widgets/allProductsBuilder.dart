import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/home/data/dummyData.dart';
import 'package:greenmart/features/home/widgets/itemCard.dart';

class AllProductsBuilder extends StatelessWidget {
  const AllProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('All Products', style: TextStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyles.caption),
            ),
          ],
        ),
        GridView.builder(
          itemCount: allProductsList.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) =>
              ItemCard(productModel: allProductsList[index]),
        ),
      ],
    );
  }
}
