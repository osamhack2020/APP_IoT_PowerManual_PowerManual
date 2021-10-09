import 'package:flutter/material.dart';
import 'package:myapp/Font.dart';
import 'package:myapp/Font.dart';


class BenchPressCount extends StatefulWidget {
   @override
    _BenchPressCountState createState() => _BenchPressCountState();
     }

class _BenchPressCountState extends State<BenchPressCount> {
   @override
    Widget build(BuildContext context) {
       return Container(
         child: Center(
           child:Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("개수:", style: KorTextStyle,),
                SizedBox(width: 10,),
                 Text("7", style: headerTextStyle,),
                 SizedBox(width: 5,),
                 Text("/12", style: subHeaderTextStyle,),
                 
               ],
             ),
             SizedBox(height: 5,),
             Row(
                 mainAxisAlignment: MainAxisAlignment.center,

               children: [
                 Text("정확한 갯수", style: KorTextStyle,),
                 SizedBox(width: 8,),
                 Text("5", style: correctHeaderTextStyle,),
               ],
             ),
             SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 
                 Text("가동범위부족", style: KorTextStyle,),
                 SizedBox(width: 7,),
                 Text("5", style: wrongHeaderTextStyle,),
                 SizedBox(width: 15,),
                 Text("팔꿈치각도부적절", style: KorTextStyle),
                 SizedBox(width: 7,),
                 Text("5", style: wrongHeaderTextStyle,),
                 
                 
                 
                
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                
                 Text("팔위치조절", style: KorTextStyle),
                 SizedBox(width: 7,),
                 Text("5", style: wrongHeaderTextStyle,),
                 SizedBox(width: 15,),
                 Text("추가자세문제", style: KorTextStyle),
                 SizedBox(width: 7,),
                 Text("5", style: wrongHeaderTextStyle,),
               ],
             )
           ],
         ),
         ),
         
       );
    }
    
 }