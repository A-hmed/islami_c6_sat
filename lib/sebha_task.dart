
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class SebhaTask extends StatefulWidget {

  @override
  State<SebhaTask> createState() => _SebhaTaskState();
}

class _SebhaTaskState extends State<SebhaTask> {
  int counter=0;
  List<String> tsabeh=['سبحان الله','الحمد لله','الله اكبر'];
  int index=0;
  double angle=0.0;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    //var provider=Provider(context);
    // return scafold and assign it to main file
    return  Scaffold(
      body: Container(
        width: double.infinity,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // to contain two images behind them
              Container(
                height:size.height*.39,
                child:Stack(
                  children: [
                    Positioned(child: Image.asset(('assets\images\head of seb7a.png'))) ,

                    InkWell(
                      onTap:pressedBtn ,
                    ),
                    //              Positioned(child: provider.isDark()?Image.asset(('assets\images\head dark of seb7a.png')):Image.asset(('assets\images\head of seb7a.png')),
                    //              left:size.width*.48,
                    // )
                    Positioned(child: Transform.rotate(angle:angle ,
                        child:Image.asset(('assets\images\body of seb7a.png'))) ,
                      left:size.width*.48,
                    )
                    //   Image.asset('assets\images\body of seb7a.png'),
                  ],
                ),

              ),
              Text('عدد التسبيحات',textAlign: TextAlign.center,
                style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color:Color(0xFFECBF8F),borderRadius: BorderRadius.circular(20)),
                  child: Text('$counter',textAlign: TextAlign.center,
                    style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              SizedBox(height: 15,),
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color:Color(0xFFB7935F),borderRadius: BorderRadius.circular(40)),
                  child: Text('${tsabeh[index]}',textAlign: TextAlign.center,
                    style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),)),

            ]),

      ),


    );
  }
  void pressedBtn(){
    counter++;
    angle+=1/33;
    setState(() {});
    if(counter==34){
      index++;
      counter=0;
    }
    if(index>tsabeh.length-1){
      index=0;

    }

  }
}
