import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../AppStyle.dart';
import '../../widgets/sura_verse.dart';

class AhadethTab extends StatefulWidget {

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<String> ahadethNames =[] ;

  @override
  Widget build(BuildContext context) {
    if(ahadethNames.isEmpty) readAhadethFile();
    return Container(
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image.asset("assets/images/hadeth_logo.png"),
            Divider(thickness: 3, color: AppStyle.primaryColor,),
            Container(
              child: Text("Ahadeth", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Divider(thickness: 3,color: AppStyle.primaryColor),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return  Text(ahadethNames[index]);
                  },
                  separatorBuilder: (context, index){
                    return Divider(thickness: 3,color: AppStyle.primaryColor);
                  },
                  itemCount: ahadethNames.length),
            )
          ]
      ),
    );
  }

  void readAhadethFile() async {
    String ahadethContent = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadeth = ahadethContent.split("#\r\n");
    for(int i =0;i<ahadeth.length;i++){
      print(ahadeth[i]);
      print("--------------------------------------------");
      String hadethContent = ahadeth[i];
      List<String> hadethLines = hadethContent.split("\n");
      ahadethNames.add(hadethLines[0]);
      hadethLines.removeAt(0);
    }
    setState(() {});
  }
}