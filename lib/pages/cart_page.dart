import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_cart/models/cartModel.dart';
import 'package:tech_cart/pages/homeWidget/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          Expanded(child:  _CartList().p32().expand()),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel.cartModel; // to access properties of Cart
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Cart is empty".text.xl5.make().centered()
        : ListView.builder(
        itemCount: _cart.items.length,   // return length of items added in the cart
        itemBuilder: (context, index) {
          final item = _cart.items[index];  // storing items of particular index each time in the item var
          if(item == null){
            return Container();
          }

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Image.network(
                          item.image
                      ).backgroundColor(Colors.transparent).h32(context),
                      trailing: IconButton(
                          onPressed: ()=>{},
                          icon: Icon(Icons.done)
                      ),
                      title: item.name.text.xl2.make(),
                      subtitle: item.desc.text.xl.make(),

                    ),
                  //   ElevatedButton(
                  //     onPressed: (){
                  //       setState(() {
                  //         _cart.remove(item);
                  //         _cart.totalPrice - item.price;
                  //       });
                  //     },
                  //     style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(
                  //         (context.theme.primaryColor)
                  //       ),
                  //       shape: MaterialStateProperty.all(
                  //          StadiumBorder()
                  //       )
                  //     ),
                  //     child: Container(
                  //     child: Icon(CupertinoIcons.d),
                  //     )
                  //   //   child: Icon(
                  //   //     Icons.delete,
                  //   //     color: Colors.white,),
                  //   // ).backgroundColor(context.theme.primaryColorLight),
                  ],

                ),
                Row(
                  children: [
                    TextButton.icon(
                        onPressed: (){
                          setState(() {
                            _cart.totalPrice - item.price;
                          });
                        },
                        label: "Remove".text.color(context.theme.colorScheme.secondary).make())
                  ],
                )
              ],
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
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();  // to access properties of Cart
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl4.make(),  // changes to reflect the price of total items added to the cart

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
}