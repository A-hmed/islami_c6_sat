import 'package:flutter/material.dart';
import 'package:islami_c6_sat/AppStyle.dart';
import 'package:islami_c6_sat/widgets/sura_verse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {

  List<String> suraNames = ["الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس", "هود"
    , "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه", "الأنبياء", "الحج", "المؤمنون"
    , "النّور", "الفرقان", "الشعراء", "النّمل", "القصص", "العنكبوت", "الرّوم", "لقمان", "السجدة", "الأحزاب", "سبأ"
    , "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر", "فصّلت", "الشورى", "الزخرف", "الدّخان", "الجاثية", "الأحقاف"
    , "محمد", "الفتح", "الحجرات", "ق", "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة"
    , "الحشر", "الممتحنة", "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج"
    , "نوح", "الجن", "المزّمّل", "المدّثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس", "التكوير", "الإنفطار"
    , "المطفّفين", "الإنشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد", "الشمس", "الليل", "الضحى", "الشرح"
    , "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات", "القارعة", "التكاثر", "العصر",
    "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر", "المسد", "الإخلاص", "الفلق", "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       children:[
         Image.asset("assets/images/quran_logo.png"),
         Divider(thickness: 3, color: AppStyle.lightPrimaryColor,),
         Container(
           child: Text(AppLocalizations.of(context)!.suraName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
         ),
         Divider(thickness: 3,color: AppStyle.lightPrimaryColor),
         Expanded(
           child: ListView.separated(
               itemBuilder: (context, index){
                  return  SuraVerse(suraNames[index], index);
               },
               separatorBuilder: (context, index){
                 return Divider(thickness: 3,color: AppStyle.lightPrimaryColor);
               },
               itemCount: suraNames.length),
         )
       ]
      ),
    );
  }
}
