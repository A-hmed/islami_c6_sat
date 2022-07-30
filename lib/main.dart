import 'package:flutter/material.dart';
import 'package:islami_c6_sat/screens/ahdeth_details/ahadeth_details.dart';
import 'package:islami_c6_sat/screens/home/Home.dart';
import 'package:islami_c6_sat/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
