import 'package:flutter/material.dart';
import 'package:tech_cart/models/catalog.dart';
import 'package:tech_cart/widget/drawer.dart';

import '../widget/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    String project = "Tech Cart";
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white), // set icon color to white
        title: Text("Tech Cart", style: TextStyle(color: Colors.white),),
        // backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
          // itemCount: CatalogModel.items.length,
          itemCount: dummyList.length,
          itemBuilder: (context, index){
              return ItemWidget(
                item: dummyList[index],
                // item: CatalogModel.items[index]
              );
          }),
      drawer: MyDrawer(),
    );
  }
}
