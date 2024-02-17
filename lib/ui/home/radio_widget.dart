import 'package:flutter/material.dart';

class Radioo extends StatelessWidget {
  const Radioo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.4),
                child: Image(image: AssetImage("assets/image/radio_image.png"))),
            SizedBox(height: MediaQuery.of(context).size.width*0.08,),
            Text("إذاعة القرآن الكريم",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize:  MediaQuery.of(context).size.width*0.05
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, iconSize: MediaQuery.of(context).size.width*0.1,icon: Icon(Icons.skip_previous_rounded,color: Theme.of(context).colorScheme.tertiary,)),
                SizedBox(width: 15,),
                IconButton(onPressed: (){}, iconSize: MediaQuery.of(context).size.width*0.1,icon: Icon(Icons.play_arrow_rounded,color: Theme.of(context).colorScheme.tertiary)),
                SizedBox(width: 15,),
                IconButton(onPressed: (){}, iconSize: MediaQuery.of(context).size.width*0.1,icon: Icon(Icons.skip_next_rounded  ,color: Theme.of(context).colorScheme.tertiary)),
              ],
            )




          ],
        ),
      ),
    );
  }
}
