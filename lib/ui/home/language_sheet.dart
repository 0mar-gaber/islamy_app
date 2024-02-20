import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/setting_provider.dart';

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({super.key});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();

}

class _LanguageSheetState extends State<LanguageSheet> {

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(27) , topRight:Radius.circular(27) )
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            selectedLanguage(provider.language=='en'?"English":"العريبة"),
            SizedBox(height: height*0.03),
            InkWell(
              onTap: () async {
                Navigator.pop(context);
                SharedPreferences preferences = await SharedPreferences.getInstance();
                if(provider.language=="ar"){
                  provider.changeAppLanguage("en");
                  preferences.setString("language", "en");

                }else {
                  provider.changeAppLanguage("ar");
                  preferences.setString("language", "ar");

                }
              },
              child:  unSelectedLanguage(provider.language=='ar'?"English":"العريبة"),

            )
          ]
        ),
      ),
    );
  }

  selectedLanguage(String language){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:  Theme.of(context).colorScheme.tertiary),),
        Icon(Icons.done,size: 35,color: Theme.of(context).colorScheme.tertiary,),

      ],
    );
  }

  unSelectedLanguage(String language){
    return SizedBox(
        width: double.infinity,
        child: Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold , color: Theme.of(context).colorScheme.onBackground),textAlign: TextAlign.start,));

  }

}
