import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    String project = "Tech Cart";
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech Cart"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello this is $project flutter main pagee....."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
