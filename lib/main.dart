import 'package:flutter/material.dart';
import 'package:tech_cart/pages/home_page.dart';
import 'package:tech_cart/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_cart/utils/MyRoutes.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily
      ),
      // to remove the debug signature from top right corner
      debugShowCheckedModeBanner: false,
      darkTheme:  ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.logInRoute,
      routes: {
        "/" : (context) => HomePage(),
        "/login" : (context) => LoginPage(),
      },
    );
  }
}
