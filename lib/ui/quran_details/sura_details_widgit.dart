import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SuraDetails extends StatefulWidget {
  static const String route = "sura_details";
   const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    SuraDetailsArgs sura = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs ;
    if(lines.isEmpty){
      loadSuraContent(sura.index);
    }
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(provider.theme==ThemeMode.dark?"assets/image/darkback.png":"assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title:  Text(AppLocalizations.of(context)!.islamy,style: TextStyle(fontSize: height*0.05)),iconTheme: IconThemeData(size: height*0.05,color: Theme.of(context).colorScheme.onBackground)),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(40)
            ),
            width: width*0.9,
            height: height*0.8,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:width*.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(sura.title,
                        style: TextStyle(
                          fontSize: width*0.07,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onErrorContainer
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
                      //   child:Icon(Icons.play_arrow,color: Theme.of(context).colorScheme.onSecondary,size: width*0.045),
                      // ),

                    ],
                  ),
                ),
                Container(height: height*0.003,color: Theme.of(context).colorScheme.tertiary,width:width*.7),
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.only(top: height*0.02),
                    margin: EdgeInsets.only( right:width*0.033 ,left: width*0.033),
                    child: lines.isNotEmpty
                    ?ListView.separated(
                      itemBuilder: (context, index) => Text(
                        textDirection: TextDirection.rtl,
                        "${lines[index]}(${index+1})",
                        style: TextStyle(
                          fontFamily: "DTHULUTH",
                          fontSize: width*0.07,
                            fontWeight: FontWeight.w700,

                            color: Theme.of(context).colorScheme.onErrorContainer
                        ),
                      ),
                      itemCount: lines.length,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: height*0.01,),

                    )
                    :const Center(child: CircularProgressIndicator(),),
                  ),
                )
              ],
            ) ,

          ),
        ),
      ),
    );
  }

  List<String> lines = [];

  loadSuraContent(int index) async {
    String suraContent =  await rootBundle.loadString("assets/texts/${index+1}.txt");
    lines = suraContent.trim().split("\n");

    lines.removeWhere((line) => line.trim().isEmpty); //to remove extra lines in end



    setState(() {

    });

  }
}

class SuraDetailsArgs {
  String title ;
  int index ;
  SuraDetailsArgs({required this.title,required this.index});
}
