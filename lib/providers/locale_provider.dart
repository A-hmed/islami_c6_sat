import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
   String currentLocale ="en";

   void changeCurrentLocale(String newLocale){
      if(newLocale == currentLocale) return;
      currentLocale = newLocale;
      notifyListeners();
   }
}