



import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:myapp/Font.dart';
import 'package:myapp/exercise/benchPress/page/afterBenchPress.dart';
import '../page/afterBenchPress.dart';
class ExerciseBenchPressPageButoon extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           ElevatedButton(
            onPressed: (){
              /*Navigator.push(
                context,
                 MaterialPageRoute(builder: (context)=> ()))
               );*/
            },
           child: Text("자세 설명 보기", style: KorHeaderStyle,)
           ),
           SizedBox(width: 30,),
           ElevatedButton(
            onPressed: (){
              Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context)=> AfterBenchPress())
              );
            },
                 child: Text("다음세트로", style: KorHeaderStyle,)),
                 
        ],
      ),
    );
}
}