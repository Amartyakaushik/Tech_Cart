import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          _CartList().p32().expand(),
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) =>
          ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
                onPressed: ()=>{},
                icon: Icon(Icons.remove_circle_outline)),
            title: "Item 1".text.xl4.make(),
          ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$9999".text.xl4.make(),

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