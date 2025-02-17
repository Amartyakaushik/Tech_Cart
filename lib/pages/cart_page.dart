import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_cart/core/store.dart';
import 'package:tech_cart/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cart = CartModel.cartModel;
  void updateCart() {
    setState(() {}); // ✅ Triggers UI update when cart changes
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.xl2.make().centered(),
        // iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(child:  _CartList(cart: _cart, onCartUpdated: updateCart).p32().expand()), // ✅ Pass callback
          Divider(),
          _CartTotal(), // ✅ Pass cart instance
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  final CartModel cart;
  final VoidCallback onCartUpdated;  // ✅ Callback to notify CartPage
  const _CartList({super.key, required this.cart, required this.onCartUpdated});
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  // final _cart = CartModel.cartModel; // to access properties of Cart
  @override
  Widget build(BuildContext context) {
    return widget.cart.items.isEmpty
        ? "Cart is empty".text.xl5.make().centered()
        : ListView.builder(
        itemCount: widget.cart.items.length,   // return length of items added in the cart
        itemBuilder: (context, index) {
          final item = widget.cart.items[index];  // storing items of particular index each time in the item var
          if(item == null){
            return Container();
          }

          return Card(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            item.image
                        ).backgroundColor(Colors.transparent).h56(context),
                        trailing: "\$${item.price}".text.xl.make(),
                        title: item.name.text.xl2.make(),
                        subtitle: item.desc.text.xl.make(),

                      ),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: (){
                            setState(() {
                              RemoveMutation(widget.cart.items[index]);  // to remove the cart item form the page
                              // widget.cart.remove(item);
                              // _cart.totalPrice - item.price;
                            });
                            // widget.onCartUpdated();  // to reflect the dynamic change in the total price
                          },
                          label: "Remove".text.color(context.theme.colorScheme.secondary).make(),
                          icon: Icon(CupertinoIcons.delete),
                      ),
                      TextButton.icon(
                        onPressed: (){},
                        label: "Save for later".text.color(context.theme.colorScheme.secondary).make(),
                        icon: Icon(CupertinoIcons.bookmark),
                      ),
                      TextButton.icon(
                        onPressed: (){},
                        label: "Buy this now".text.color(context.theme.colorScheme.secondary).make(),
                        icon: Icon(Icons.flash_on),
                      ),

                    ],
                  )
                ],
              ),
            ),
          );

          // VxBox(
          //   child: Row(
          //     children: [
          //       CatalogImage(image: item.image),
          //       Column(
          //         children: [
          //           Column(
          //             children: [
          //               item.name.text.color(Colors.white).make(),
          //               item.desc.text.color(context.theme.primaryColor).make(),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Icon(Icons.delete)
          //             ],
          //           )
          //         ],
          //
          //       )
          //     ],
          //   ),
          // );
        }
        );

  }
}

class _CartTotal extends StatelessWidget {
  // late final CartModel cart;
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final _cart = CartModel.cartModel;  // to access properties of Cart
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {  // ✅ Correct function signature
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            },
          ),
                  // .make();  // changes to reflect the price of total items added to the cart

          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying is not option yet!".text.make(),));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    (context.theme.colorScheme.primary) // for button color
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: "Buy".text.color(Colors.white).make(),
          ).w32(context)
        ],
      ).px20(),
    );
  }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   setState(() {}); // ✅ Triggers UI update when dependencies change
  // }
}