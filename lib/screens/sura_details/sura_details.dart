import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../AppStyle.dart';

class SuraDetails extends StatefulWidget {
  static const routeName ="Sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = "";
  List<String> suraLines= [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    readFile(args.fileName);
    return Stack(
      children: [
        Image.asset("assets/images/background.png",width: double.infinity, fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("${args.suraName}", style: TextStyle(color: Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body:suraLines.isEmpty? Center(child: CircularProgressIndicator()): Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height *.7,
                width: width * .9,
               margin: EdgeInsets.only(left: width *.05, right: width*.05, top: height* .05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: AssetImage("")),

                  color: Colors.white
                ),
                child:Container(
                  margin: EdgeInsets.all(8),
                  child: ListView.separated(itemBuilder: (context, index){
                    return Text("${suraLines[index]}(${index+1})", textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 24),);
                  },itemCount: suraLines.length,
                    separatorBuilder: (context, index){
                      return Divider(thickness: 3,color: AppStyle.lightPrimaryColor);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void readFile(String fileName) async {
     suraContent = await rootBundle.loadString("assets/files/$fileName");
     suraLines = suraContent.split("\n");
     setState(() {});
  }
}
class SuraDetailsArguments{
  String suraName;
  String fileName;
  SuraDetailsArguments({required this.suraName, required this.fileName});
}