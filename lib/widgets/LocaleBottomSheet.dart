import 'package:flutter/material.dart';
import 'package:islami_c6_sat/AppStyle.dart';
import 'package:islami_c6_sat/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class LocaleBottomSheet extends StatelessWidget {
  late LocaleProvider localeProvider;

  @override
  Widget build(BuildContext context) {
    localeProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                localeProvider.changeCurrentLocale("en");
                Navigator.pop(context);
              },
              child: getSelectedWidget("en")),
          SizedBox(height: 24,),
          InkWell(
              onTap: (){
                localeProvider.changeCurrentLocale("ar");
                Navigator.pop(context);
              },
              child: getSelectedWidget("ar"))
        ],
      ),
    );
  }
  Widget getSelectedWidget(String locale){
    return localeProvider.currentLocale == locale ?
        Row(
          children: [
            Text(locale == "en"? "Enlgish" :"العربيه",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppStyle.lightPrimaryColor),),
            Spacer(),
            Icon(Icons.done, color: AppStyle.lightPrimaryColor,)
          ],)
        :   Text(locale == "en"? "Enlgish" :"العربيه", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }
}
