import 'package:flutter/material.dart';

import '../../AppStyle.dart';
import '../../model/hadeth.dart';

class AhadethDetails extends StatefulWidget {
  static const routeName = "Ahadeth details";

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "${hadeth.title}",
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height * .7,
                width: width * .9,
                margin: EdgeInsets.only(
                    left: width * .05, right: width * .05, top: height * .05),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        "${hadeth.content[index]}",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 24),
                      );
                    },
                    itemCount: hadeth.content.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
