import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';


class AhadethDetailsWidget extends StatefulWidget {
  static const String route = "Ahadeth_details";

  AhadethDetailsWidget({super.key});

  @override
  State<AhadethDetailsWidget> createState() => _AhadethDetailsWidgetState();
}

class _AhadethDetailsWidgetState extends State<AhadethDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    Object? index =  ModalRoute.of(context)?.settings.arguments as int;
    int index2 =index as int;
    if(ahadeth.isEmpty){
      loadAhadethContent(index2);
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
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: width*.05),
                  child: Text(
                    titles[index].trim().toString(),
                    style: TextStyle(
                      fontSize: width*0.07,
                      fontWeight: FontWeight.w900,
                      fontFamily: "KOUFIBD",
                      color: Theme.of(context).colorScheme.onErrorContainer

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(height: height*0.003,color: Theme.of(context).colorScheme.tertiary,width:width*.7),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    margin: EdgeInsets.only( right:width*0.033 ,left: width*0.033),
                    child: ahadeth.isNotEmpty
                        ?ListView.separated(
                      itemBuilder: (context, index) => Text(
                        textDirection: TextDirection.rtl,
                        "${content[index2]}",
                        style:  TextStyle(
                            fontFamily: "DTHULUTH",
                            fontSize: width*0.07,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onErrorContainer
                        ),
                      ),
                      itemCount: 1,
                      separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 5,),

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

  List<String> ahadeth = [];
  List<String> titles= [];
  List<String> content= [];

  loadAhadethContent(int index) async {

    String ahadethContent = await rootBundle.loadString("assets/texts/ahadeth.txt");
    ahadeth = ahadethContent.trim().split("#");
    for(int i = 0 ; i  <ahadeth.length-1; i++) {

      List<String> list = ahadeth[i].toString().trim().split("\n");
      titles.add(list.first);
      list.removeAt(0);
      content.add(list.toString());
    }

    setState(() {

    });


  }

}
