import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy/providers/setting_provider.dart';
import 'package:islamy/theme_style/app_theme.dart';
import 'package:islamy/ui/ahadeth_details/ahadeth_details_widgit.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/quran_details/sura_details_widgit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  late bool dark  ;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if(!preferences.containsKey("is dark")){
    print("false");
    preferences.setBool("is dark", false);
    dark = false ;
  }else{
     dark = !preferences.getBool("is dark")!;
     print("dark : $dark");

  }

  // String? oldLanguage = preferences.get("language") as String?;
  runApp( ChangeNotifierProvider(
      create: await(context)=> SettingsProvider()..changeAppTheme(dark!),
        // ..changeAppLanguage(oldLanguage!),
      child: const IslamyApp()));

}
class IslamyApp extends StatelessWidget {
  const IslamyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
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
      locale:  Locale(provider.language),
      theme:AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.theme,
      routes: {
        HomeScreen.route:(context)=>const HomeScreen(),
        SuraDetails.route:(context)=> const SuraDetails(),
        AhadethDetailsWidget.route:(context)=> AhadethDetailsWidget(),
      },
      initialRoute: HomeScreen.route,
    );
  }

}
