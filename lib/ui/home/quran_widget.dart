import 'package:flutter/material.dart';
import 'package:islamy/providers/setting_provider.dart';
import 'package:islamy/ui/home/quran_name_verse.dart';
import 'package:islamy/ui/quran_details/sura_details_widgit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class Quran extends StatelessWidget {
  final List<String> suraNames = [
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];
  final List<int> versesNumber = [7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,135,112,78,118,64,77,227,93,88,
    69,60,34,30,73,54,45,83,182,88,75,85,54,53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,12,30,52,52,
    44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,5,19,5,8,8,11,11,8,3,9,5,4,6,3,6,3,5,4,5,6
  ];

  Quran({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    double width =  MediaQuery.of(context).size.width ;
    double height =  MediaQuery.of(context).size.height ;
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/image/quran_image.png",width: width*0.4,fit: BoxFit.fitWidth),
          Expanded(
            child: Stack(
              children: [
                Column(
                children: [
                  Container(
                    margin:  EdgeInsets.only(top: height*0.002),
                    height: height*0.003,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppLocalizations.of(context)!.suraVerse,style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w400,color: Theme.of(context).colorScheme.onPrimary)),
                      Text(AppLocalizations.of(context)!.suraName,style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.w400,color: Theme.of(context).colorScheme.onPrimary)),
                    ],
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: height*0.002),
                    height: height*0.003,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder:
                            (context, index) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, SuraDetails.route,arguments: SuraDetailsArgs(title: suraNames[index], index: index));
                                },
                                child: QuranNameVerse(name: suraNames[index], verse: versesNumber[index].toString())),
                        itemCount: suraNames.length
                    ),
                  ),
                ],
              ),
                Center(
                    child: Container(
                      margin:  EdgeInsets.only(top: height*0.003),
                      width: width*0.005,
                      color: Theme.of(context).colorScheme.tertiary,
                )
                )
            ]),
          )
        ],
      )
    );
  }
}
