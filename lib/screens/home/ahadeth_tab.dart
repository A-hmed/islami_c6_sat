import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c6_sat/model/hadeth.dart';
import 'package:islami_c6_sat/screens/ahdeth_details/ahadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../AppStyle.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) readAhadethFile();
    return ahadeth.isNotEmpty
        ? Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/hadeth_logo.png"),
                  Divider(
                    thickness: 3,
                    color: AppStyle.lightPrimaryColor,
                  ),
                  Container(
                    child:  Text(
                      AppLocalizations.of(context)!.ahadeth,
                      style:
                          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(thickness: 3, color: AppStyle.lightPrimaryColor),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AhadethDetails.routeName,
                                    arguments: ahadeth[index]);
                              },
                              child: Text(
                                ahadeth[index].title,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.center,
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              thickness: 3, color: AppStyle.lightPrimaryColor);
                        },
                        itemCount: ahadeth.length),
                  )
                ]),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  void readAhadethFile() async {
    String ahadethContent =
        await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadeth = ahadethContent.split("#\r\n");
    for (int i = 0; i < ahadeth.length; i++) {
      String hadethContent = ahadeth[i];
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = new Hadeth(title: title, content: hadethLines);
      this.ahadeth.add(hadeth);
    }
    setState(() {});
  }
}
