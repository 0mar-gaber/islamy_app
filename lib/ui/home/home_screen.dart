import 'package:flutter/material.dart';
import 'package:islamy/theme_style/app_theme.dart';
import 'package:islamy/ui/home/ahadeth_widget.dart';
import 'package:islamy/ui/home/quran_widget.dart';
import 'package:islamy/ui/home/radio_widget.dart';
import 'package:islamy/ui/home/sebha_widget.dart';
import 'package:islamy/ui/home/settings_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    onTab(int index){
      setState(() {
        currentIndex=index;
      });
    }
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(AppTheme.isDark?"assets/image/darkback.png":"assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title:  Text(AppLocalizations.of(context)!.islamy)),
        body: navWidgets[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,

            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_quran.png"),),label: "Quran",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_hadeth.png"),),label: "Ahadeth",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_sebha.png"),),label: "Sebha",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/icons/icon_radio.png"),),label: "Radio",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings",backgroundColor: Theme.of(context).colorScheme.primary),
        ],
          onTap: onTab,
        ),
      ),
    );
  }
}
