import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_cart/models/catalog.dart';
import 'package:tech_cart/widget/drawer.dart';

import '../widget/item_widget.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    // String project = "Tech Cart";
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white), // set icon color to white
        title: Text("Tech Cart", style: TextStyle(color: Colors.white),),
        // backgroundColor: Colors.deepPurple,
      ),
      body: (CatalogModel.items != null &&  CatalogModel.items!.isNotEmpty )? ListView.builder(  // first always check for null then check for empty condition other wise the ui will crash
          itemCount: CatalogModel.items?.length,
          // itemCount: dummyList.length,
          itemBuilder: (context, index) =>
              ItemWidget(
                // item: dummyList[index],
                item: CatalogModel.items![index]
              ),
          ) :Center(
        child: CircularProgressIndicator(),
      ),
      drawer: MyDrawer(),
    );
  }

  void loadData() async{  // async used because await is used with async function only
    await Future.delayed(Duration(seconds: 11));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json"); // await used because catalogJson returns Future<String>
    // print("JSON Loaded: $catalogJson"); // for debuggins
    final decodeData = jsonDecode(catalogJson);  // to decode the object in the json file
    var productData = decodeData["products"];  // extract all the products
    CatalogModel.items = List.from(productData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    setState(() {});
  }
}
