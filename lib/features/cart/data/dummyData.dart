import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/features/cart/data/cartItemMdel.dart';
import 'package:greenmart/features/home/data/productModel.dart';

List<CartItemModel> cartDummyData = [
  CartItemModel(
    product: ProductModel(
      taqId: UniqueKey().toString(),
      description: 'not used here 1',
      id: 'd1',
      image: AppImages.pepperSvg,
      name: 'Bell Pepper Red',
      quantityForPrice: '1kg',
      price: 4.99,
    ),
  ),
  CartItemModel(
    product: ProductModel(
      taqId: UniqueKey().toString(),
      description: 'not used here 2',
      id: 'd2',
      image: AppImages.eggSvg,
      name: 'Egg Chicken Red',
      quantityForPrice: '4pcs, Price',
      price: 1.99,
    ),
  ),
  CartItemModel(
    product: ProductModel(
      taqId: UniqueKey().toString(),
      description: 'not used here 3',
      id: 'd3',
      image: AppImages.bananaSvg,
      name: 'Organic Bananas',
      quantityForPrice: '12kg, Price',
      price: 3.00,
    ),
  ),
];