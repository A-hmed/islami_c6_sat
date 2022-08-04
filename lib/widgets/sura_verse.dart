import 'package:flutter/material.dart';
import 'package:islami_c6_sat/screens/sura_details/sura_details.dart';

class SuraVerse extends StatelessWidget {
  String suraName;
  int index;
  SuraVerse(this.suraName, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: SuraDetailsArguments(suraName: suraName,
                fileName: "${index+1}.txt"));
      },
      child: Container(
        child: Text(suraName,textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
