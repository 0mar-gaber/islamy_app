import 'package:flutter/material.dart';
import 'package:islamy/ui/ahadeth_details/ahadeth_details_widgit.dart';

class Ahadeth extends StatelessWidget {
  const Ahadeth({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.15),
          child: Column(
            children: [
              Image(image: AssetImage("assets/image/ahadeth_image.png")),
              Container(
                margin: const EdgeInsets.all(5),
                height: 4,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text("الأحاديث",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06,fontWeight: FontWeight.w400)),
              Container(
                margin: const EdgeInsets.all(5),
                height: 4,
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(
                child: ListView.builder(
                  // padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                    itemBuilder: (context, index) => InkWell(
                        onTap:() {
                          Navigator.of(context).pushNamed(AhadethDetailsWidget.route,arguments: index);
                        },
                        child: Container( margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.03,bottom:MediaQuery.of(context).size.width*0.03), child: Text("${index+1} الحديث رقم ",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900)))),
                    itemCount: 50
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
