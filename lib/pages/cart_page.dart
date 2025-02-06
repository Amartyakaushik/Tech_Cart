import 'package:flutter/material.dart';
import 'package:tech_cart/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.xl2.color(context.theme.colorScheme.secondary).make().centered(),
        // iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
