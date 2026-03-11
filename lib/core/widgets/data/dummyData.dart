import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/features/category_products/screens/bakeryScreen.dart';
import 'package:greenmart/features/category_products/screens/beveragesScreen.dart';
import 'package:greenmart/features/category_products/screens/cookingOilScreen.dart';
import 'package:greenmart/features/category_products/screens/dairyScreen.dart';
import 'package:greenmart/features/category_products/screens/fruitsScreen.dart';
import 'package:greenmart/features/category_products/screens/meatScreen.dart';
import '../../../features/explore/data/exploreCategoryModel.dart';

List<ExploreCategoryModel> exploreCategories = [
  ExploreCategoryModel(
    id: 'c1',
    title: 'Fresh Fruits & Vegetable',
    imagePath: AppImages.fruitsVegetable,
    bgColor: Color(0xffEEF7F1),
    borderColor: Color(0xff53B175),
    destination: FruitsScreen(),
  ),
  ExploreCategoryModel(
    id: 'c2',
    title: 'Cooking Oil & Ghee',
    imagePath: AppImages.cookingOil,
    bgColor: Color(0xffFDF3E7),
    borderColor: Color(0xffF8A44C),
    destination: CookingOilScreen(),
  ),
  ExploreCategoryModel(
    id: 'c3',
    title: 'Meat & Fish',
    imagePath: AppImages.meatAndFish,
    bgColor: Color(0xffFDE8E4),
    borderColor: Color(0xffF7A593),
    destination: MeatScreen(),
  ),
  ExploreCategoryModel(
    id: 'c4',
    title: 'Bakery & Snacks',
    imagePath: AppImages.bakery,
    bgColor: Color(0xffF4EBF7),
    borderColor: Color(0xffD3B0E0),
    destination: BakeryScreen(),
  ),
  ExploreCategoryModel(
    id: 'c5',
    title: 'Dairy & Eggs',
    imagePath: AppImages.dairyEggs,
    bgColor: Color(0xffFFF8E1),
    borderColor: Color(0xffFDE598),
    destination: DairyScreen(),
  ),
  ExploreCategoryModel(
    id: 'c6',
    title: 'Beverages',
    imagePath: AppImages.beverages,
    bgColor: Color(0xffE6F2FF),
    borderColor: Color(0xffB7DFF5),
    destination: BeveragesScreen(),
  ),
 
];
