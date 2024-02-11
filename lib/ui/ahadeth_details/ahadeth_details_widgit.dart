import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  Text("${(index2+1)} الحديث رقم ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.07,
                      fontWeight: FontWeight.w900,

                    ),
                  ),
                  Container(height: 3,color: Theme.of(context).colorScheme.primary,width:MediaQuery.of(context).size.width*.7),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      margin: EdgeInsets.only( right:MediaQuery.of(context).size.width*0.033 ,left: MediaQuery.of(context).size.width*0.033),
                      child: ahadeth.isNotEmpty
                          ?ListView.separated(
                        itemBuilder: (context, index) => Text(
                          textDirection: TextDirection.rtl,
                          "${ahadeth[index2]}",
                          style: const TextStyle(
                              fontFamily: "DTHULUTH",
                              fontSize: 30
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

  loadAhadethContent(int index) async {

    String ahadethContent = await rootBundle.loadString("assets/texts/ahadeth.txt");
    ahadeth = ahadethContent.split("#");
    setState(() {

    });


  }

}
