import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int index = 0;
  String tsabehNumber = '33';
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    List<String> tsbehName = [
      AppLocalizations.of(context)!.sobhanAllah,
      AppLocalizations.of(context)!.elhamdlelah,
      AppLocalizations.of(context)!.allahAkbar,
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(
        height: 25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onSebhaClick(),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(rotation),
              child: Image(
                color: Theme.of(context).primaryColor,
                width: 170,
                height: 220,
                image: AssetImage('assets/images/LightSebhaPic.png'),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 25,
      ),
      Text(
        AppLocalizations.of(context)!.tasbehNumber,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              tsabehNumber,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              tsbehName[index],
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )
    ]);
  }

  onSebhaClick() {
    int tsbehanumber = int.parse(tsabehNumber);
    rotation += 1 / 33;
    if (tsbehanumber > 1) {
      tsbehanumber--;
    } else {
      tsbehanumber = 33;
      index++;
    }
    if (index == 3) {
      index = 0;
    }
    if (rotation >= 1) {
      rotation = 1 / 33;
    }
    tsabehNumber = tsbehanumber.toString();
    setState(() {});
  }
}
