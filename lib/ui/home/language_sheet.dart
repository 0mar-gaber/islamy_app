import 'package:flutter/material.dart';

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({super.key});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();

}

class _LanguageSheetState extends State<LanguageSheet> {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;

    List<Widget> languageRows = [
      selectedLanguage("English"),
      SizedBox(height: height*0.03),
      unSelectedLanguage("العريبة")
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(27) , topRight:Radius.circular(27) )
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: languageRows
        ),
      ),
    );
  }

  selectedLanguage(String language){
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:  Theme.of(context).colorScheme.tertiary),),
          Icon(Icons.done,size: 35,color: Theme.of(context).colorScheme.tertiary,),

        ],
      ),
    );
  }

  unSelectedLanguage(String language){
    return InkWell(
      onTap: (){},
      child: SizedBox(
          width: double.infinity,
          child: Text(language,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold , color: Theme.of(context).colorScheme.onBackground),textAlign: TextAlign.start,)),
    );

  }

}
