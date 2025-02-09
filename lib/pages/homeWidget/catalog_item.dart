import 'package:flutter/material.dart';
import 'package:tech_cart/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalogModel.dart';
import '../../widget/themes.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item? catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            CatalogImage(image : catalog!.image),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog!.name.text.lg.color(context.theme.colorScheme.secondary).bold.make(), // accent color
                catalog!.desc.text.textStyle(context.captionStyle).make(),
                28.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog!.price}".text.bold.xl.make(),
                    _AddToCart(catalog : catalog!)
                  ],
                ).pOnly(right: 10.0)
              ],
            ))
          ],
        )
    ).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({super.key, required this.catalog});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  final _cart = CartModel.cartModel; // Replace final _cart = CartModel(); with final _cart = CartModel.cartModel; to use singleton
  bool isInCart = false;
  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        // onPressed: (){
        //   isInCart = isInCart.toggle();
        //   final _catalog = CatalogModel();
        //   _cart.catalog = _catalog;
        //   _cart.add(widget.catalog);
        //   setState(() {});
        // },  // define action to add items to the cart when clicked
        onPressed: () {   // define action to add items to the cart when clicked
          try {
            isInCart = isInCart.toggle();
            final catalog = CatalogModel();
            _cart.catalog = catalog;
            _cart.add(widget.catalog);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item added to cart"),
                duration: Duration(seconds: 1),
              ),
            );
            setState(() {});
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error adding item to cart"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                (context.theme.colorScheme.primary) // for button color
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: isInCart
            ? Icon(Icons.done, color: Colors.white,)
            : "Add to cart".text.color(Colors.white).make(),
      );
  }
}
