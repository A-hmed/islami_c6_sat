import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../AppStyle.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int cnt = 0;

  double angle =45*pi/180;
  List<String> tasabeh = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله العظيم واتوب اليه",
    "لا اله الا انت سبحانك اني كنت من الظالمين",
    "لا حول ولا قوه الا بالله"
  ];
  int index=0;
  void _increament(){
    if(cnt==32)
    {
      cnt=0;
      index==7?index=0:index++;
    }
    setState(() {

      cnt++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .2,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * .26,
              child: Image.asset(
                "assets/images/head_sebha_dark.png",
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .size
                      .width * .178),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .7,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * .7,
              child: InkWell(
                  onTap: () {
                    angle+=100;
                   _increament();
                  },
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset("assets/images/body_sebha_logo.png"))),
            ),
          ],
        ),
        Text(
          AppLocalizations.of(context)!.numberofTasbeh,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * .1,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width * .41),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: AppStyle.lightPrimaryColor.withOpacity(.57),
          ),
          child: Center(
              child: Text(
                "$cnt",
                style: TextStyle(fontSize: 25),
              )),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery
                    .of(context)
                    .size
                    .width * .25,
                vertical: MediaQuery
                    .of(context)
                    .size
                    .width * .04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: AppStyle.lightPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5, left: 12, right: 12),
              child:  Text(
                "${tasabeh[index]}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}
