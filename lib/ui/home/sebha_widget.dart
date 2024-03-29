import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';



class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double rotateAngle = 0;
  int counter = 0  ;
  List<String> sebhaTitle = ["سبحان الله","الحمد لله","الله اكبر"] ;
  int i = 0 ;
  onSeb7aClicked(){
    setState(() {
      rotateAngle+=90;
      if(counter<33){
        counter++;
      }else {
        counter=0;
        if(i<2){
          i++;

        }else{
          i=0;
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left:width*0.08,top:  height*0.1),
                child:  Image(image: AssetImage(provider.theme==ThemeMode.dark?"assets/image/dark_head_of_seb7a.png":"assets/image/head_sebha_logo.png"),width: width*0.1,fit: BoxFit.fitWidth)),
            GestureDetector(
              onTap: () {
                onSeb7aClicked();
              },
              child: Transform.rotate(
                angle: rotateAngle * (3.14/1800),
                child:  Image(image: AssetImage(provider.theme==ThemeMode.dark?"assets/image/dark_body_of_seb7a.png":"assets/image/body_of_seb7a.png"),width: width*0.4,fit: BoxFit.fitWidth),
              ),
            ),
            SizedBox(height: height*0.06,),
            Text(AppLocalizations.of(context)!.numberofpraises,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize:  width*0.05
              ),
            ),
            SizedBox(height: height*0.06,),
            Container (
              width:  width*0.1,
              height:  height*0.07,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text(
                counter.toString(),
                style: TextStyle(
                    fontSize:  width*0.03,
                    fontFamily:"KOUFIBD",
                    fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary
                ),
              )
              ),
            ),// counter
            SizedBox(height: height*0.05,),
            Container(
              width:  width*0.2,
              height:  height*0.05,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(40)
              ),
              child: Center(child: Text(
                sebhaTitle[i],
                style: TextStyle(
                    fontSize:  width*0.034,
                    fontFamily:"KOUFIBD",
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
              ),
            ), // سبحان الله



          ],
        ),
      ),
    );
  }
}
