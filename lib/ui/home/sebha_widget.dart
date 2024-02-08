import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0  ;
  onSeb7aClicked(){
    setState(() {
      counter++;

    });
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08,top:  MediaQuery.of(context).size.width*0.2),
                child: Image(image: AssetImage("assets/image/head_sebha_logo.png"))),
            Container(
                child: Image(image: AssetImage("assets/image/body_of_seb7a.png"))),
            SizedBox(height: MediaQuery.of(context).size.width*0.08,),
            Text("عدد التسبيحات",
              style: TextStyle(
                color: Colors.black,
                fontSize:  MediaQuery.of(context).size.width*0.05
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.08,),
            Container (
              width:  MediaQuery.of(context).size.width*0.1,
              height:  MediaQuery.of(context).size.width*0.12,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text(
                counter.toString(),
                style: TextStyle(
                    fontSize:  MediaQuery.of(context).size.width*0.03,
                    fontFamily:"KOUFIBD",
                    fontWeight: FontWeight.bold
                ),
              )
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.05,),
            InkWell(
              onTap: onSeb7aClicked,
              child: Container(
                width:  MediaQuery.of(context).size.width*0.2,
                height:  MediaQuery.of(context).size.width*0.07,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Center(child: Text(
                  "سبحان الله",
                  style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.width*0.034,
                      fontFamily:"KOUFIBD",
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
                )
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
