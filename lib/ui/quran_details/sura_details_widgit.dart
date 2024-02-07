import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Islamy")),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
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

                        ),
                      ),
                      const SizedBox(width: 120,),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child:Icon(Icons.play_arrow,color: Colors.white,size: 33),
                        ),
                      ),
                      const SizedBox(width: 50,),

                    ],
                  ),
                  Container(height: 3,color: Theme.of(context).colorScheme.primary,width:MediaQuery.of(context).size.width*.7),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsets.only( right:MediaQuery.of(context).size.width*0.033 ,left: MediaQuery.of(context).size.width*0.033),
                      child: lines.isNotEmpty
                      ?ListView.separated(
                        itemBuilder: (context, index) => Text(
                          " ${lines[index]}",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 30
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
    lines = suraContent.split("\n");
    setState(() {

    });
  }
}

class SuraDetailsArgs {
  String title ;
  int index ;
  SuraDetailsArgs({required this.title,required this.index});
}
