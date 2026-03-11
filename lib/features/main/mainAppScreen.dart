import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/widgets/customSvgPicture.dart';
import 'package:greenmart/features/account/screens/account_screen.dart';
import 'package:greenmart/features/cart/screens/myCartScreen.dart';
import 'package:greenmart/features/explore/screens/exploreScreen.dart';
import 'package:greenmart/features/favorite/screens/favoriteScrean.dart';
import 'package:greenmart/features/home/screens/shopScreen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});
  
  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

int currentIndex = 0;
List<Widget> screens = [
  ShopScreen(),
  ExploreScreen(),
  MyCartScreen(),
  FavoriteScreen(),
  AccountScreen(),
];

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.storeSvg),
            activeIcon: CustomSvgPicture(
              path: AppImages.storeSvg,
              color: AppColors.primaryColor,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.exploreSvg),
            activeIcon: CustomSvgPicture(
              path: AppImages.exploreSvg,
              color: AppColors.primaryColor,
            ),

            label: 'Explore',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.cartSvg),
            activeIcon: CustomSvgPicture(
              path: AppImages.cartSvg,
              color: AppColors.primaryColor,
            ),

            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.heartSvg),
            activeIcon: CustomSvgPicture(
              path: AppImages.heartSvg,
              color: AppColors.primaryColor,
            ),

            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.userSvg),
            activeIcon: CustomSvgPicture(
              path: AppImages.userSvg,
              color: AppColors.primaryColor,
            ),

            label: 'Account',
          ),
        ],
      ),
    );
  }
}
