import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/widgets/customSvgPicture.dart';
import 'package:greenmart/core/widgets/customTextFormField.dart';
import 'package:greenmart/features/home/widgets/allProductsBuilder.dart';
import 'package:greenmart/features/home/widgets/bestSellingBuilder.dart';
import 'package:greenmart/features/home/widgets/offersBuilder.dart';
import 'package:greenmart/features/search/screens/searchScreen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomSvgPicture(
          path: AppImages.logoSvg,
          color: AppColors.primaryColor,
          height: 42,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () {
                  pushTo(context, SearchScreen());
                },
                child: Hero(
                  tag: 'search',
                  child: Material(
                    color: Colors.transparent,
                    child: CustomTextFormField(
                      // onTap: () {
                      // onTapOfCustomTextFormField not do ===> because exist enabled => false
                      //   pushTo(context, SearchScreen());
                      // },
                      enabled: false,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Store',
                    ),
                  ),
                ),
              ),

              // SizedBox(height: 22),
              OffersBuilder(),
              BestSellingBuilder(),
              AllProductsBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
