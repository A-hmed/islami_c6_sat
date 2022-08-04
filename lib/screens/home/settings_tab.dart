import 'package:flutter/material.dart';
import 'package:islami_c6_sat/providers/locale_provider.dart';
import 'package:islami_c6_sat/providers/theme_provider.dart';
import 'package:islami_c6_sat/widgets/ThemeBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/LocaleBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late LocaleProvider localeProvider;
  late ThemeProvider themeProvider;
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    localeProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(16),
              child: Text(AppLocalizations.of(context)!.language, textAlign: TextAlign.start, style: Theme.of(context).textTheme.titleMedium,)
          ),
          InkWell(
            onTap: (){
              showLocaleBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Text(localeProvider.currentLocale == "en"? "English" : "العربيه"),
                   Spacer(),
                  Icon(Icons.arrow_downward_outlined),
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(16),
              child: Text(AppLocalizations.of(context)!.theme, textAlign: TextAlign.start, style: Theme.of(context).textTheme.titleMedium,)
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Text(themeProvider.currentTheme == ThemeMode.light?
                  AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark),
                  Spacer(),
                  Icon(Icons.arrow_downward_outlined),
                ],
              ),
            ),
          ),
        ],
    );
  }

  void showLocaleBottomSheet() {
    showModalBottomSheet(context: context, builder: (context){
      return LocaleBottomSheet();
    });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context){
      return ThemeBottomSheet();
    });
  }
}
