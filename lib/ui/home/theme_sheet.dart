import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/setting_provider.dart';

class ThemeSheet extends StatefulWidget {
  const ThemeSheet({super.key});

  @override
  State<ThemeSheet> createState() => _ThemeSheetState();
}

class _ThemeSheetState extends State<ThemeSheet> {
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
            children: [
              selectedTheme(provider.theme==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark),
              SizedBox(height: height*0.03),
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  SharedPreferences preferences = await SharedPreferences.getInstance();

                  if(provider.theme==ThemeMode.light){
                    provider.changeAppTheme(true);
                    preferences.setBool("is dark", true);
                  }else{
                    provider.changeAppTheme(false);
                    preferences.setBool("is dark", false);

                  }

                },
                child: unSelectedTheme(provider.theme==ThemeMode.dark?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark),

              )
            ]
        ),
      ),
    );
  }

  selectedTheme(String language){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.tertiary),),
        Icon(Icons.done,size: 35,color:Theme.of(context).colorScheme.tertiary,),

      ],
    );
  }

  unSelectedTheme(String language){
    return SizedBox(
        width: double.infinity,
        child: Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onBackground),textAlign: TextAlign.start,));

  }
}
