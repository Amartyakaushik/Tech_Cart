import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
      colorScheme: ColorScheme.light(
        primary: darkBluishColor,   // use it as button color
        secondary: darkBluishColor  // accent color
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle:  TextStyle(
          color: Colors.black,
        ),
        // textTheme: Theme.of(context).textTheme,
      ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
    colorScheme: ColorScheme.dark(
        primary: lightBluishColor,
        secondary: Colors.white  // accent color
    ),
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 10,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle:  TextStyle(
        color: Colors.black,
      ),
      // textTheme: Theme.of(context).textTheme,
    ),
  );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}