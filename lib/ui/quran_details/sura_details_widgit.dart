import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/theme_style/app_theme.dart';

class SuraDetails extends StatefulWidget {
  static const String route = "sura_details";
   const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs sura = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs ;
    if(lines.isEmpty){
      loadSuraContent(sura.index);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(sura.title,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.07,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.onErrorContainer

                        ),
                      ),
                      const SizedBox(width: 120,),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child:  CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
                          child:Icon(Icons.play_arrow,color: Theme.of(context).colorScheme.onSecondary,size: 33),
                        ),
                      ),
                      const SizedBox(width: 50,),

                    ],
                  ),
                  Container(height: 3,color: Theme.of(context).colorScheme.tertiary,width:MediaQuery.of(context).size.width*.7),
                  Expanded(
                    child: Container(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.033),
                      margin: EdgeInsets.only( right:MediaQuery.of(context).size.width*0.033 ,left: MediaQuery.of(context).size.width*0.033),
                      child: lines.isNotEmpty
                      ?ListView.separated(
                        itemBuilder: (context, index) => Text(
                          textDirection: TextDirection.rtl,
                          "${lines[index]}(${index+1})",
                          style: TextStyle(
                            fontFamily: "DTHULUTH",
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.onErrorContainer
                          ),
                        ),
                        itemCount: lines.length,
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
