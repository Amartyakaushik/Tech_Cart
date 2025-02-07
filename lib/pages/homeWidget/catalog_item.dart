import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
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
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              (context.theme.colorScheme.primary) // for button color
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          )),
                      child: "Add to cart".text.color(Colors.white).make(),
                    )
                  ],
                ).pOnly(right: 10.0)
              ],
            ))
          ],
        )
    ).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}
