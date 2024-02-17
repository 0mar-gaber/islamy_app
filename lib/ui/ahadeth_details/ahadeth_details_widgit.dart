import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/theme_style/app_theme.dart';


class AhadethDetailsWidget extends StatefulWidget {
  static const String route = "Ahadeth_details";

  AhadethDetailsWidget({super.key});

  @override
  State<AhadethDetailsWidget> createState() => _AhadethDetailsWidgetState();
}

class _AhadethDetailsWidgetState extends State<AhadethDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Object? index =  ModalRoute.of(context)?.settings.arguments as int;
    int index2 =index as int;
    if(ahadeth.isEmpty){
      loadAhadethContent(index2);
    }


    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(AppTheme.isDark?"assets/image/darkback.png":"assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Islamy")),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(40)
            ),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.8,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width*.07),
              child: Column(
                children: [
                  Text(
                    titles[index].trim().toString(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.05,
                      fontWeight: FontWeight.w900,
                      fontFamily: "KOUFIBD",
                      color: Theme.of(context).colorScheme.onErrorContainer

                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(height: 3,color: Theme.of(context).colorScheme.onErrorContainer,width:MediaQuery.of(context).size.width*.7),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      margin: EdgeInsets.only( right:MediaQuery.of(context).size.width*0.033 ,left: MediaQuery.of(context).size.width*0.033),
                      child: ahadeth.isNotEmpty
                          ?ListView.separated(
                        itemBuilder: (context, index) => Text(
                          textDirection: TextDirection.rtl,
                          "${content[index2]}",
                          style:  TextStyle(
                              fontFamily: "DTHULUTH",
                              fontSize: 40,
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
              ),
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
