import 'package:flutter/material.dart';
import 'package:greenmart/features/account/data/account_menu_item_model.dart';

class AccountMenuTile extends StatelessWidget {
  final AccountMenuItem menu;

  const AccountMenuTile({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            _leadingIcon(),
            const SizedBox(width: 16),
            _title(),
            _arrow(),
          ],
        ),
      ),
    );
  }

  Widget _leadingIcon() {
    return Icon(menu.leadingIcon, size: 24, color: Colors.black87);
  }

  Widget _title() {
    return Expanded(
      child: Text(
        menu.label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _arrow() {
    return const Icon(
      Icons.arrow_forward_ios,
      size: 16,
      color: Colors.black54,
    );
  }
}