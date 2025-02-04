import 'package:flutter/material.dart';
import 'package:tech_cart/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    String project = "Tech Cart";
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white), // set icon color to white
        title: Text("Tech Cart", style: TextStyle(color: Colors.black),),
        // backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          child: Text("Hello this is $project flutter main page..."),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
