import 'package:flutter/material.dart';
import 'package:tech_cart/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});  // constructor where the need of item is mentioned

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
          elevation: 10,
          child: ListTile(
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text("\$${item.price}",
              textScaler: TextScaler.linear(1.5),
            style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
    );
  }
}

// const Placeholder();   was used outside padding rsn ?