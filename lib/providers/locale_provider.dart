import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
   String currentLocale ="en";

   LocaleProvider(){
      init();
   }
   void init(){
      getLocalFromPrefs();
   }
   void changeCurrentLocale(String newLocale){
      if(newLocale == currentLocale) return;
      currentLocale = newLocale;
      updateLocale(newLocale);
      notifyListeners();
   }
   void updateLocale(String newLocale)async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', newLocale);
   }
   void getLocalFromPrefs(){
      SharedPreferences.getInstance().then((value){
         currentLocale = value.getString('locale')??'en';
         notifyListeners();
      }
      );
   }
}