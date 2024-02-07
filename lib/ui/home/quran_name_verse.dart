import 'package:flutter/material.dart';

class QuranNameVerse extends StatelessWidget {
  String name ;
  String verse ;
  QuranNameVerse({super.key, required this.name,required this.verse});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(verse,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
            Text(name,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
          ]
      ),
    );
  }
}
