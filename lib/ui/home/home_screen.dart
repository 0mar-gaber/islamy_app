import 'package:flutter/material.dart';
import 'package:islamy/providers/setting_provider.dart';
import 'package:islamy/theme_style/app_theme.dart';
import 'package:islamy/ui/home/ahadeth_widget.dart';
import 'package:islamy/ui/home/quran_widget.dart';
import 'package:islamy/ui/home/radio_widget.dart';
import 'package:islamy/ui/home/sebha_widget.dart';
import 'package:islamy/ui/home/settings_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static const String route = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> navWidgets =[
    Quran(),
    const Ahadeth(),
    const Sebha(),
    const Radioo(),
    Settings(),
  ];
  int currentIndex  = 0;
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    onTab(int index){
      setState(() {
        currentIndex=index;
      });
    }
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(provider.theme==ThemeMode.dark?"assets/image/darkback.png":"assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title:  Text(AppLocalizations.of(context)!.islamy,style: TextStyle(fontSize: height*0.05))),
        body: navWidgets[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,

            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_quran.png"),size: width*0.07),label: AppLocalizations.of(context)!.quran,backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_hadeth.png"),size: width*0.07),label:AppLocalizations.of(context)!.ahadeth,backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_sebha.png"),size: width*0.07),label: AppLocalizations.of(context)!.sebha,backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_radio.png"),size: width*0.07),label: AppLocalizations.of(context)!.radio,backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: Icon(Icons.settings,size:  width*0.07),label: AppLocalizations.of(context)!.settings,backgroundColor: Theme.of(context).colorScheme.primary),
        ],
          onTap: onTab,
        ),
      ),
    );
  }
}
