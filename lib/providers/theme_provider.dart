import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  ThemeProvider(){
    init();
  }
  void init(){
    getModeFromPrefs();
  }
  void changeCurrentTheme(ThemeMode newTheme){
    if(newTheme == currentTheme) return;
    currentTheme = newTheme;
    updateMode(newTheme);
    notifyListeners();
  }
  void updateMode(ThemeMode newMode)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    newMode==ThemeMode.light?await prefs.setBool('mode', false):await prefs.setBool('mode', true);
  }
  void getModeFromPrefs(){
    SharedPreferences.getInstance().then((value){
      bool dark = value.getBool('mode')??false;
      print(dark);
      if(dark){
        currentTheme = ThemeMode.dark;
      }else{
        currentTheme = ThemeMode.light;
      }
      notifyListeners();
    });
  }
}