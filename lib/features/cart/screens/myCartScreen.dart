import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/color.dart';
import 'package:greenmart/core/styles/textStyle.dart';
import 'package:greenmart/core/widgets/MainButton.dart';
import 'package:greenmart/features/cart/data/cartItemMdel.dart';
import 'package:greenmart/features/cart/data/dummyData.dart';
import 'package:greenmart/features/cart/widgets/cartItemTile.dart';
import 'package:greenmart/features/cart/widgets/checkoutBottomSheet.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<CartItemModel> cart = cartDummyData;

  double calculateTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void increment(int index) {
    setState(() => cart[index].quantity++);
  }

  void decrement(int index) {
    setState(() {
      if (cart[index].quantity > 1) {
        cart[index].quantity--;
      }
    });
  }

  void remove(int index) {
    setState(() => cart.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    final total = calculateTotal();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart', style: TextStyles.subtitle),
      ),
      body: cart.isEmpty ? _emptyCart() : _cartList(),
      bottomNavigationBar: _checkoutButton(total),
    );
  }

  Widget _emptyCart() {
    return const Center(child: Text('Your cart is empty'));
  }

  Widget _cartList() {
    return ListView.separated(
      itemCount: cart.length,
      separatorBuilder: (_, __) => const Divider(
        color: AppColors.gainsboroColor,
        thickness: 1,
        indent: 20,
        endIndent: 20,
      ),
      itemBuilder: (context, index) {
        return CartItemTile(
          cartItem: cart[index],
          onIncrement: () => increment(index),
          onDecrement: () => decrement(index),
          onRemove: () => remove(index),
        );
      },
    );
  }

  Widget _checkoutButton(double total) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: PrimaryButton(
        height: 65,
        width: double.infinity,
        backgroundColor: AppColors.primaryColor,
        textStyle: TextStyles.subtitle.copyWith(color: Colors.white),
        title: 'Go to Checkout   \$${total.toStringAsFixed(2)}',
        onPressed: () {
          if (total > 0) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => CheckoutBottomSheet(totalPrice: total),
            );
          }
        },
      ),
    );
  }
}