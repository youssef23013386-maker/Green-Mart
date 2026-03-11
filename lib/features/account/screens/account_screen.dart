import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/appImages.dart';
import 'package:greenmart/core/functions/navigation.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/features/account/data/account_menu_item_model.dart';
import 'package:greenmart/features/account/widgets/account_menu_tile.dart';
import 'package:greenmart/features/auth/screens/LoginScreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const List<AccountMenuItem> menuList = [
    AccountMenuItem(leadingIcon: Icons.shopping_bag_outlined, label: 'Orders'),
    AccountMenuItem(leadingIcon: Icons.badge_outlined, label: 'My Details'),
    AccountMenuItem(
      leadingIcon: Icons.location_on_outlined,
      label: 'Delivery Address',
    ),
    AccountMenuItem(
      leadingIcon: Icons.credit_card_outlined,
      label: 'Payment Methods',
    ),
    AccountMenuItem(
      leadingIcon: Icons.local_offer_outlined,
      label: 'Promo Cord',
    ),
    AccountMenuItem(
      leadingIcon: Icons.notifications_outlined,
      label: 'Notifecations',
    ),
    AccountMenuItem(leadingIcon: Icons.help_outline, label: 'Help'),
    AccountMenuItem(leadingIcon: Icons.info_outline, label: 'About'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _profileHeader(),
            _divider(),
            _menuList(),
            _logoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        children: [
          _avatar(),
          const SizedBox(width: 16),
          _userInfo(),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200, width: 2),
        image: const DecorationImage(
          image: AssetImage(AppImages.profilePicture),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'youssef elmay',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'youssef@gmail.com',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(color: Colors.grey.shade200, height: 1);
  }

  Widget _menuList() {
    return Expanded(
      child: ListView.separated(
        itemCount: menuList.length,
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey.shade200, height: 1),
        itemBuilder: (context, index) {
          return AccountMenuTile(menu: menuList[index]);
        },
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          pushAndRemoveUntilAll(context, const LoginScreen());
        },
        icon: Icon(Icons.logout, color: AppColors.primaryColor),
        label: const Text(
          'Log Out',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: const Color(0xFFF2F3F2),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}