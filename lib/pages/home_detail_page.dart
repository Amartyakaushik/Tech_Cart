import 'package:flutter/material.dart';
import 'package:tech_cart/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.creamColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar:
      Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl2.red800.make(),
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to cart".text.color(Colors.white).make(),
            ).wh(150, 50)
          ],
        ).p(32),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).backgroundColor(MyTheme.creamColor).h32(context),
            ),
            Expanded(
                child: VxArc(
                  arcType: VxArcType.convey, edge: VxEdge.top,
                    height: 30,
                    child: Container(
                      width: context.screenWidth, color: Colors.white,
                      child: Column(
                        children: [
                          catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                          catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                          10.heightBox,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into .".text.textStyle(context.captionStyle).make().p16(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
