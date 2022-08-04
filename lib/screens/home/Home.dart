import 'package:flutter/material.dart';
import 'package:islami_c6_sat/AppStyle.dart';
import 'package:islami_c6_sat/providers/theme_provider.dart';
import 'package:islami_c6_sat/screens/home/ahadeth_tab.dart';
import 'package:islami_c6_sat/screens/home/quran_tab.dart';
import 'package:islami_c6_sat/screens/home/radio_tab.dart';
import 'package:islami_c6_sat/screens/home/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c6_sat/screens/home/settings_tab.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static var routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(), AhadethTab(), RadioTab(), SebhaTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Stack(
      children: [
        Image.asset(themeProvider.currentTheme == ThemeMode.light? "assets/images/background.png":
        "assets/images/dark_bg.png",width: double.infinity, fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami, style:Theme.of(context).textTheme.titleLarge,),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppStyle.lightPrimaryColor),
            child: BottomNavigationBar(
              onTap: (currentTab){
                currentIndex = currentTab;
                 setState(() {});
              },
              currentIndex: currentIndex,
              selectedLabelStyle: TextStyle(color: Colors.black),
              selectedItemColor: Colors.black,
              selectedIconTheme: IconThemeData(color: Colors.black),
              items: [
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_quran.png")), label: "quran"),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),label: "ahadeth",),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),label: "radio"),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),label: "sebha"),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: "setting")
              ],
            ),
          ),
        ),
      ],
    );
  }

}
