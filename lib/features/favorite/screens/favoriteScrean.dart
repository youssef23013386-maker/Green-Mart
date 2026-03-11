import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/features/favorite/widgets/favoriteItemTile.dart';
import 'package:greenmart/features/search/data/dummyData.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Favorite',
        style: TextStyles.subtitle,
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      itemCount: mockSearchDrinksProductsList.length,
      itemBuilder: (context, index) {
        final product = mockSearchDrinksProductsList[index];

        return FavoriteItemTile(
          productModel: product,
        );
      },
      separatorBuilder: (_, __) => const Divider(
        indent: 20,
        endIndent: 20,
        thickness: 1,
        color: AppColors.gainsboroColor,
      ),
    );
  }
}