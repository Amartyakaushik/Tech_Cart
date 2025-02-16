import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_cart/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cartModel.dart';
import '../../models/catalogModel.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});
//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   final _cart = CartModel.cartModel; // Replace final _cart = CartModel(); with final _cart = CartModel.cartModel; to use singleton
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ;
    // bool isInCart = _cart.items.contains(catalog) ?? false;
    return
      ElevatedButton(
        // onPressed: (){
        //   isInCart = isInCart.toggle();
        //   final _catalog = CatalogModel();
        //   _cart.catalog = _catalog;
        //   _cart.add(widget.catalog);
        //   setState(() {});
        // },
        onPressed: () {// define action to add items to the cart when clicked
          if(!isInCart){

            try {
              // isInCart = isInCart.toggle();
              // final catalog = CatalogModel();
              // _cart.catalog = catalog;
              // _cart.add(widget.catalog);
              AddMutation(catalog);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Item added to cart"),
                  duration: Duration(seconds: 1),
                ),
              );
              // setState(() {});
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error adding item to cart"),
                  backgroundColor: Colors.red,
                ),
              );
            }
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
            : Icon(CupertinoIcons.cart_badge_plus, color: Colors.white,),
      );
  }
}
