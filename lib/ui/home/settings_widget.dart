import 'package:flutter/material.dart';
import 'package:islamy/ui/home/language_sheet.dart';
import 'package:islamy/ui/home/theme_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});




  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: height*.07),
        padding: EdgeInsets.all(width*.024),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onErrorContainer),
            ),
            SizedBox(height: height*.0266),
            InkWell(
              onTap: (){
                showLanguageBottomSheet(context);
              },
              child: Container(
                  width: double.infinity,
                  height: height*0.055,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:  Center(child: Text(provider.language=='en'?"English":"العريبة",textAlign: TextAlign.center,style: TextStyle(fontSize: width*0.04 , fontWeight: FontWeight.bold ),))
              ),
            ),
            SizedBox(height: height*.0466),
             Text(
              AppLocalizations.of(context)!.theme,
              style: TextStyle(fontSize:width*0.06,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onErrorContainer),
            ),
            SizedBox(height: height*.0266),
            InkWell(
              onTap: (){
                showThemeBottomSheet(context);
              },
              child: Container(
                  width: double.infinity,
                  height: height*0.055,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child:  Center(child: Text(provider.theme==ThemeMode.dark?"Dark":"Light",textAlign: TextAlign.center,style: TextStyle(fontSize:width*0.04,fontWeight: FontWeight.bold),))
              ),
            ),
          ],
        ),
      ),
    );
  }



  showLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context)=>const LanguageSheet());
  }
  showThemeBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context)=>const ThemeSheet());
  }

}
