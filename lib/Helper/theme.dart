import 'package:flutter/material.dart';

class Themes {

  static ThemeData lightTheme(BuildContext context ) {
    // set provide value to update theme app level, it will be set once single widget is build
    return ThemeData(
      primarySwatch: Themes.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //textTheme: GoogleFonts.latoTextTheme(),
      useMaterial3: false,
      brightness: Brightness.light,
      chipTheme: const ChipThemeData(backgroundColor: Colors.white),
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
      iconTheme: IconThemeData(
        color: Colors.black54.withOpacity(0.5),
      ),
    );
  }

  static const MaterialColor primaryColor = MaterialColor(
    0xFF6F415E,
    <int, Color>{
      50: Color(0xFFF8F6F7),
      100: Color(0xFFF1ECEF),
      200: Color(0xFFDBD0D7),
      300: Color(0xFFC4B2BD),
      400: Color(0xFF9B7A8F),
      500: Color(0xFF6F415E),
      600: Color(0xFF633A54),
      700: Color(0xFF432739),
      800: Color(0xFF321E2B),
      900: Color(0xFF21131C),
    },
  );
}