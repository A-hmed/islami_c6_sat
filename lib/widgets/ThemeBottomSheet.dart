import 'package:flutter/material.dart';
import 'package:islami_c6_sat/AppStyle.dart';
import 'package:islami_c6_sat/providers/locale_provider.dart';
import 'package:islami_c6_sat/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                themeProvider.changeCurrentTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: getSelectedWidget(ThemeMode.light)),
          SizedBox(height: 24,),
          InkWell(
              onTap: (){
                themeProvider.changeCurrentTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: getSelectedWidget(ThemeMode.dark))
        ],
      ),
    );
  }

  Widget getSelectedWidget(ThemeMode theme){
    String themeName = theme == ThemeMode.light ? AppLocalizations.of(context)!.light: AppLocalizations.of(context)!.dark;
    return themeProvider.currentTheme == theme ?
        Row(
          children: [
            Text(themeName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppStyle.lightPrimaryColor),),
            Spacer(),
            Icon(Icons.done, color: AppStyle.lightPrimaryColor,)
          ],)
        :   Text(themeName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }
}
