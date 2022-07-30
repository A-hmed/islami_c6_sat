import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeCurrentTheme(ThemeMode newTheme){
    if(newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
}