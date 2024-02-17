import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy/theme_style/app_theme.dart';
import 'package:islamy/ui/ahadeth_details/ahadeth_details_widgit.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/quran_details/sura_details_widgit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(){
  runApp(const IslamyApp());
}
class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: const Locale('ar'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.isDark?ThemeMode.dark
          :ThemeMode.light,
      routes: {
        HomeScreen.route:(context)=>const HomeScreen(),
        SuraDetails.route:(context)=> const SuraDetails(),
        AhadethDetailsWidget.route:(context)=> AhadethDetailsWidget(),
      },
      initialRoute: HomeScreen.route,
    );
  }
}
