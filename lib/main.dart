import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_c6_sat/AppStyle.dart';
import 'package:islami_c6_sat/providers/locale_provider.dart';
import 'package:islami_c6_sat/providers/theme_provider.dart';
import 'package:islami_c6_sat/screens/ahdeth_details/ahadeth_details.dart';
import 'package:islami_c6_sat/screens/home/Home.dart';
import 'package:islami_c6_sat/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(_)=>ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: const MyApp()),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      locale: Locale(localeProvider.currentLocale),
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: themeProvider.currentTheme,
      title: 'Flutter Demo',
      routes: {
        Home.routeName:(_)=>Home(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        AhadethDetails.routeName:(_)=>AhadethDetails()
      },
      initialRoute: Home.routeName,
    );
  }
}
