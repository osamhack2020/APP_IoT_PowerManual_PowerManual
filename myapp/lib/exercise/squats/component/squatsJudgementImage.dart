import 'package:flutter/material.dart';

class SquatsJudgementImage extends StatefulWidget {
   @override
    _SquatsJudgementImageState createState() => _SquatsJudgementImageState();
     }
int state=0;
class _SquatsJudgementImageState extends State<SquatsJudgementImage> {
   @override
    Widget build(BuildContext context) {
       return Container(
         child: Column(
           children: [
             Text("Squats"),
             Image.asset('assets/img/squats_standup.jpeg'),
             Text('운동 시작 전 자세입니다.')
             
           ],
         ),
       ); 
    }
 }
