import 'package:flutter/material.dart';
import 'package:islamy/ui/home/ahadeth_widget.dart';
import 'package:islamy/ui/home/quran_widget.dart';
import 'package:islamy/ui/home/radio_widget.dart';
import 'package:islamy/ui/home/sebha_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> navWidgets =[
    Quran(),
    const Sebha(),
    const Ahadeth(),
    const Radioo(),
  ];
  int currentIndex  = 0;
  @override
  Widget build(BuildContext context) {
    onTab(int index){
      setState(() {
        currentIndex=index;
      });
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/image/background.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Islamy")),
        body: navWidgets[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,

            items: [
              BottomNavigationBarItem(icon: Image.asset("assets/icons/icon_quran.png",),label: "Quran",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: Image.asset("assets/icons/icon_sebha.png",),label: "Sebha",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: Image.asset("assets/icons/icon_hadeth.png",),label: "Ahadeth",backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(icon: Image.asset("assets/icons/icon_radio.png",),label: "Radio",backgroundColor: Theme.of(context).colorScheme.primary),
        ],
          onTap: onTab,
        ),
      ),
    );
  }
}
