import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_cart/models/cartModel.dart';
import 'package:tech_cart/models/catalogModel.dart';
import 'package:tech_cart/utils/MyRoutes.dart';

// import '../widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'homeWidget/catalog_header.dart';
import 'homeWidget/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // To load the initial data 
    super.initState();
    loadData();
    // one of the steps taked to encounter the cart page issue
    final cart = CartModel.cartModel;
    cart.catalog = CatalogModel();
  }

  void loadData() async{  // async used because await is used with async function only
    await Future.delayed(Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/updated_catalog.json"); // await used because catalogJson returns Future<String>
    // print("JSON Loaded: $catalogJson"); // for debuggins
    final decodeData = jsonDecode(catalogJson);  // to decode the object in the json file
    var productData = decodeData["products"];  // extract all the products
    CatalogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    // String project = "Tech Cart";
    return Scaffold(
      backgroundColor: context.canvasColor,
      // adding floating action button for the cart
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
        backgroundColor: context.theme.colorScheme.primary,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }


}









// // --------------------------------Used Grid view Instead--------------------------------------------
// ListView.builder(  // first always check for null then check for empty condition other wise the ui will crash
// itemCount: CatalogModel.items?.length,
// // itemCount: dummyList.length,
// itemBuilder: (context, index) =>
// ItemWidget(
// // item: dummyList[index],
// item: CatalogModel.items![index]
// ),
// )

// // --------------------------used  Velocity_X instead-----------------------------------------
// appBar: AppBar(
// // iconTheme: IconThemeData(color: Colors.white), // set icon color to white
// title: Text("Tech Cart", style: TextStyle(color: Colors.white),),
// // backgroundColor: Colors.deepPurple,
// ),
// body: (CatalogModel.items != null &&  CatalogModel.items!.isNotEmpty )?
// GridView.builder(  // (Delegate,itemBuilder,itemCount)
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // it takes Delegate to ensure no of items in a row
// crossAxisCount: 2,
// crossAxisSpacing: 16,
// mainAxisSpacing: 16,),
// itemBuilder: (context, index){  //(Grid Tile) it decides the contents
// final item = CatalogModel.items![index];
// return Card(
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// child: GridTile( // (header, child, footer)
// header: Container(
// padding: const EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.deepPurple,
// ),
// child: Text(
// item.name,
// style: TextStyle(color: Colors.white),
// ),
// ),
// footer: Container(
// padding: const EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: Colors.black,
// ),
// child: Text(
// item.desc,
// style: TextStyle(color: Colors.white),
// ),
// ),
//
// child: Image.network(item.image),
// ),
// );
// },
// itemCount: CatalogModel.items!.length,)
//     :Center(
// child: CircularProgressIndicator(),
// ),
// drawer: MyDrawer(),