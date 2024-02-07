import 'package:flutter/material.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/quran_details/sura_details_widgit.dart';

void main(){
  runApp(const IslamyApp());
}
class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(183, 147, 95, 1),
            primary: const Color.fromRGBO(183, 147, 95, 1),
            secondary: const Color.fromRGBO(183, 147, 95, 0.57),
            onPrimary: Colors.white,
            onSecondary: Colors.black
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
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
      ),
      routes: {
        HomeScreen.route:(context)=>const HomeScreen(),
        SuraDetails.route:(context)=> SuraDetails(),
      },
      initialRoute: HomeScreen.route,
    );
  }
}
