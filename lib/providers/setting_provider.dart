import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{

   ThemeMode theme =ThemeMode.light;
  // changeAppThem(ThemeMode appTheme) async {
  //   if(theme==appTheme) return ;
  //   theme = appTheme ;
  //   notifyListeners();
  // }

  bool isDark = false;
  changeAppTheme(bool dark) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("is dark", isDark);
    if(dark){
      isDark =true;
      theme= ThemeMode.dark;
      notifyListeners();
    }else{
      isDark =false;
      theme= ThemeMode.light;
      notifyListeners();
    }

  }

  String language = "ar" ;
  changeAppLanguage(String appLanguage) async {
    if (language ==appLanguage){
      return ;
    }else{
      language=appLanguage;
      notifyListeners();
    }

  }


}