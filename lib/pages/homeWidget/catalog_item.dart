import 'package:flutter/material.dart';
import 'package:tech_cart/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalogModel.dart';
import '../../widget/themes.dart';
import 'addToCart.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item? catalog;
  const CatalogItem({super.key, required this.catalog});

//   @override
//   State<CatalogItem> createState() => _CatalogItemState();
// }
//
// class _CatalogItemState extends State<CatalogItem> {
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
                    AddToCart(catalog : catalog!)
                  ],
                ).pOnly(right: 10.0)
              ],
            ))
          ],
        )
    ).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}

