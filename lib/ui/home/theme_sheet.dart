import 'package:flutter/material.dart';
import 'package:islamy/theme_style/app_theme.dart';

class ThemeSheet extends StatefulWidget {
  const ThemeSheet({super.key});

  @override
  State<ThemeSheet> createState() => _ThemeSheetState();
}

class _ThemeSheetState extends State<ThemeSheet> {
  @override
  Widget build(BuildContext context) {
    print(AppTheme.isDark);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(27) , topRight:Radius.circular(27) )
      ),

      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedTheme("Light"),
              SizedBox(height: height*0.03),
              unSelectedTheme("Night"),
            ]
        ),
      ),
    );
  }

  selectedTheme(String language){
    return InkWell(
      onTap: (){ setState(() {
        AppTheme.isDark = true ;
      });},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.tertiary),),
          Icon(Icons.done,size: 35,color:Theme.of(context).colorScheme.tertiary,),

        ],
      ),
    );
  }

  unSelectedTheme(String language){
    return InkWell(
      onTap: (){
        setState(() {
          AppTheme.isDark = false ;
        });
      },
      child: Container(
          width: double.infinity,
          child: Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onBackground),textAlign: TextAlign.start,)),
    );

  }
}