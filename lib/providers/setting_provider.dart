import 'package:flutter/material.dart';
class SettingsProvider extends ChangeNotifier{

  ThemeMode theme = ThemeMode.light ;
  changeAppThem(ThemeMode appTheme){
    if(theme==appTheme) return ;
    theme = appTheme ;
    notifyListeners();
  }


  String language = "ar" ;
  changeAppLanguage(String appLanguage){
    if (language ==appLanguage) return ;
    language=appLanguage;
    notifyListeners();
  }


}