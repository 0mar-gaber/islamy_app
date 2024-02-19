import 'package:flutter/material.dart';
import 'package:islamy/ui/ahadeth_details/ahadeth_details_widgit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Ahadeth extends StatelessWidget {
  const Ahadeth({super.key});

  @override
  Widget build(BuildContext context) {
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;

    return Scaffold(
      body:Center(
        child: Container(
          margin: EdgeInsets.only(top: height*0.05),
          child: Column(
            children: [
              const Image(image: AssetImage("assets/image/ahadeth_image.png")),
              Container(
                margin:  EdgeInsets.only(top:width*.07),
                height: height*0.003,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Text(AppLocalizations.of(context)!.ahadeth,
                  style: TextStyle(
                      fontSize: width*0.06,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600
                  )
              ),
              Container(
                height: height*0.003,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Expanded(
                child: ListView.builder(
                  // padding: EdgeInsets.all(width*0.04),
                    itemBuilder: (context, index) => InkWell(
                        onTap:() {
                          Navigator.of(context).pushNamed(AhadethDetailsWidget.route,arguments: index);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: height*0.02,bottom:height*0.03),
                            child: Text("${AppLocalizations.of(context)!.hadethNumber}  ${index+1}",
                                textAlign: TextAlign.center,
                                style:  TextStyle(
                                    fontSize: width*0.05,
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(context).colorScheme.onPrimary
                                )
                            )
                        )
                    ),
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
