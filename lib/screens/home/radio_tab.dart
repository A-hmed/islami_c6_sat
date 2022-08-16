import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(
        height: 100,
      ),
      const Image(
        width: 170,
        height: 220,
        image: AssetImage('assets/images/radio_image.png'),
        alignment: Alignment.center,
      ),
      Text(
        AppLocalizations.of(context)!.radioQuranKareem,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image(
                color: Theme.of(context).primaryColor,
                image: const AssetImage('assets/images/ArrowBack.png'),
              )),
          IconButton(
              onPressed: () {},
              icon: Image(
                color: Theme.of(context).primaryColor,
                image: const AssetImage('assets/images/ArrowPlay.png'),
              )),
          IconButton(
              onPressed: () {},
              icon: Image(
                color: Theme.of(context).primaryColor,
                image: const AssetImage('assets/images/ArrowNext.png'),
              ))
        ],
      )
    ]);
  }
}
