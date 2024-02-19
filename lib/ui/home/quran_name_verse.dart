import 'package:flutter/material.dart';

class QuranNameVerse extends StatelessWidget {
  String name ;
  String verse ;
  QuranNameVerse({super.key, required this.name,required this.verse});

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    return Padding(
      padding:  EdgeInsets.all( height*0.02),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(verse,style:  TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w900,color: Theme.of(context).colorScheme.onPrimary,fontFamily: "KOUFIBD")),
            Text(name, style:  TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w900,color: Theme.of(context).colorScheme.onPrimary,fontFamily: "KOUFIBD"),),
          ]
      ),
    );
  }
}
