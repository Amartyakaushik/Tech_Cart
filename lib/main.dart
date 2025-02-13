import 'package:flutter/material.dart';
import 'package:tech_cart/pages/cart_page.dart';
import 'package:tech_cart/pages/home_page.dart';
import 'package:tech_cart/pages/login_page.dart';
import 'package:tech_cart/utils/MyRoutes.dart';
import 'package:tech_cart/widget/themes.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false, // to remove the debug signature from top right corner
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context) => HomePage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.logInRoute : (context) => LoginPage(),
        MyRoutes.cartPage : (context) => CartPage(),
        // MyRoutes.homeDetialPage : (context) => HomeDetailPage(catalog: null,),
      },
    );
  }
}
