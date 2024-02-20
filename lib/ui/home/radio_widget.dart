import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Radioo extends StatelessWidget {
  const Radioo({super.key});

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: width*0.4),
                child: Image(image: AssetImage("assets/image/radio_image.png"),width: width*0.7,fit: BoxFit.fitWidth)),
            SizedBox(height: height*0.06,),
            Text(AppLocalizations.of(context)!.holyQuranRadio,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize:  width*0.05
              ),
            ),
            SizedBox(height: height*0.06,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, iconSize: width*0.1,icon: Icon(Icons.skip_previous_rounded,color: Theme.of(context).colorScheme.tertiary,)),
                SizedBox(width: width*0.02,),
                IconButton(onPressed: (){}, iconSize: width*0.1,icon: Icon(Icons.play_arrow_rounded,color: Theme.of(context).colorScheme.tertiary)),
                SizedBox(width: width*0.02,),
                IconButton(onPressed: (){}, iconSize: width*0.1,icon: Icon(Icons.skip_next_rounded  ,color: Theme.of(context).colorScheme.tertiary)),
              ],
            )




          ],
        ),
      ),
    );
  }
}
