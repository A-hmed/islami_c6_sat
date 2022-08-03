import 'package:flutter/material.dart';
import 'package:islami_c6_sat/providers/theme_provider.dart';

import 'package:provider/provider.dart';

import '../../AppStyle.dart';
import '../../providers/locale_provider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin{
  late AnimationController controller ;
  late Animation animation;
  int tsbehatCounter = 0;
  int tsbehatIndex = 0;
  List<String> tsbehat = ['سبحان الله','الحمد لله','الله اكبر','لا اله الا الله'];
  double beginAngle = 0;
  double endAngle = 0.25;

  late LocaleProvider localeProvider;
  late ThemeProvider themeProvider;
  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    setRotaion(0.25);
  }

  @override
  Widget build(BuildContext context) {
    localeProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0.0,
                  right: widthOfScreen*0.15,
                  child: Image(
                    image: AssetImage(themeProvider.currentTheme==ThemeMode.light?'assets/images/head_sebha_logo.png':'assets/images/head_sebha_dark.png'),
                    width: widthOfScreen*0.19,
                    height: 0.14*heightOfScreen,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: heightOfScreen*0.10),
                  child: AnimatedBuilder(
                    builder: (context,child)=>Transform.rotate(
                      angle: animation.value,
                      child: child,
                    ),
                    animation: animation,
                    child: GestureDetector(

                      onTap: (){
                        controller.forward(from: 0);
                        setState((){
                          if(tsbehatCounter<33){
                            tsbehatCounter++;
                          }else{
                            tsbehatCounter = 0;
                            if(tsbehatIndex<3){
                              tsbehatIndex++;
                            }else{
                              tsbehatIndex = 0;
                            }

                          }
                          setRotaion(0.25);
                        });
                      },
                      child: Image(
                        image: AssetImage(themeProvider.currentTheme==ThemeMode.light?'assets/images/body_sebha_logo.png':'assets/images/body_sebha_dark.png'),
                        height: heightOfScreen*0.3,
                        width: widthOfScreen*0.62,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightOfScreen*0.038,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: heightOfScreen*0.025,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: heightOfScreen*0.031,horizontal: widthOfScreen*0.05),
            decoration: BoxDecoration(
                color: themeProvider.currentTheme==ThemeMode.light?AppStyle.lightPrimaryColor.withOpacity(0.57):AppStyle.darkAccentColor.withOpacity(0.57),
                borderRadius: BorderRadius.circular(30)

            ),
            child: Text(
                tsbehatCounter.toString(),
                style: Theme.of(context).textTheme.bodySmall
            ),
          ),
          SizedBox(
            height: heightOfScreen*0.015,
          ),
          Container(
            padding: EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
                color: themeProvider.currentTheme==ThemeMode.light?AppStyle.lightPrimaryColor:AppStyle.darkPrimaryColor,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Text(
                tsbehat[tsbehatIndex],
                style: Theme.of(context).textTheme.headlineMedium
            ),
          )
        ],
      ),
    );
  }
  void setRotaion(double degrees){
    animation = Tween<double>(begin: beginAngle , end: endAngle).animate(controller);
    beginAngle+=degrees;
    endAngle+=degrees;
  }
}
