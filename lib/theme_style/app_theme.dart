import 'package:flutter/material.dart';

class AppTheme{


  static const Color lightPrimary = Color.fromRGBO(183, 147, 95, 1);
  static const Color darkPrimary = Color.fromRGBO(20, 26, 46, 1.0);

  static const Color lightSecondary = Color.fromRGBO(183, 147, 95, 0.57);
  static const Color darkSecondary = Color.fromRGBO(250, 204, 29, 1.0);

  static const Color lightText = Colors.black;
  static const Color darkText = Colors.white;


  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: lightPrimary,
          primary: lightPrimary,
          secondary: lightSecondary,
          tertiary: lightPrimary,
          error: lightSecondary,
          onPrimary: lightText,
          onSecondary: Colors.white,
          errorContainer: Colors.white,
          onErrorContainer: Colors.black,
          onBackground: Colors.black

      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(size: 40,color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          )
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,

      )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkPrimary,
          primary: darkPrimary,
          secondary: darkSecondary,
          tertiary: darkSecondary,
          error: darkPrimary,
          onPrimary: darkText,
          onSecondary: Colors.black,
          errorContainer: darkPrimary,
          onErrorContainer: darkSecondary,
          onBackground: Colors.white

      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(size: 40,color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          )
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: darkSecondary,
        selectedIconTheme: IconThemeData(
            size: 45
        ),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(
            size: 40
        ),

      )
  );

}