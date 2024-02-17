import 'package:flutter/material.dart';
import 'package:islamy/ui/home/language_sheet.dart';
import 'package:islamy/ui/home/theme_sheet.dart';

class Settings extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
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
              "Language",
              style: TextStyle(fontSize:40,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onErrorContainer),
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
                  child: const Center(child: Text("English",textAlign: TextAlign.center,style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ),))
              ),
            ),
            SizedBox(height: height*.0466),
             Text(
              "Theme",
              style: TextStyle(fontSize:40,fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onErrorContainer),
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
                  child: const Center(child: Text("Light",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
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
